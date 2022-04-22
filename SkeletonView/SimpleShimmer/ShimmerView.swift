//
//  ShimmerView.swift
//  SkeletonView
//
//  Created by Phuong Nguyen Lan on 4/7/22.
//

import Foundation
import UIKit

private let kShimmerAnimation = "ShimmerAnimation"

class ShimmerView: UIView {
    private let duration: Double
    private let cornerRadius: Double
    private let colors: [CGColor]
    private let colorAnchorPositions: [NSNumber] = [0, 0.5, 1 ]
    
    private lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.name = "GradientLayer"
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.colors = colors
        gradientLayer.locations = colorAnchorPositions
        return gradientLayer
    }()
    
    
    init(_ duration: Double = 1.0,
         cornerRadius: Double = 8.0,
         backgroundColor: UIColor = UIColor(from: 0xEFEFEF),
         shimmerColor: UIColor = UIColor(from: 0xD1D1D1)) {
        
        self.duration = duration
        self.cornerRadius = cornerRadius
        self.colors = [backgroundColor.cgColor,
                       shimmerColor.cgColor,
                       backgroundColor.cgColor]
        
        super.init(frame: .zero)
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let position = getPositionToBaseView()
        gradientLayer.frame = CGRect(x: -position.x,
                                     y: 0,
                                     width: UIScreen.main.bounds.width,
                                     height: frame.height)
        let radiusLimit = min(frame.height, frame.width)/2
        let minRadius = min(cornerRadius, Double(radiusLimit))
        layer.cornerRadius = minRadius
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        layer.addSublayer(gradientLayer)
        let animation = makeSlidingAnimation(duration)
        gradientLayer.add(animation, forKey: kShimmerAnimation)
    }
}

private extension ShimmerView {
    func getPositionToBaseView() -> CGPoint {
        let position = frame.origin
        guard let coordinatePosition = superview?.convert(position, to: nil) else {
            return position
        }
        return coordinatePosition
    }
    
    func makeSlidingAnimation(_ duration: CFTimeInterval) -> CAAnimation {
        let startPoint = (from: CGPoint(x: -1, y: 0.5),
                          to: CGPoint(x: 1, y: 0.5))
        let startPointAnim = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.startPoint))
        startPointAnim.fromValue = startPoint.from
        startPointAnim.toValue = startPoint.to
        
        let endPoint = (from: CGPoint(x: 0, y: 0.5),
                        to: CGPoint(x: 2, y: 0.5))
        let endPointAnim = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.endPoint))
        endPointAnim.fromValue = endPoint.from
        endPointAnim.toValue = endPoint.to
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = [startPointAnim, endPointAnim]
        animGroup.duration = duration
        animGroup.timingFunction = CAMediaTimingFunction(name: .linear)
        animGroup.repeatCount = .infinity
        animGroup.autoreverses = false
        animGroup.isRemovedOnCompletion = false
        return animGroup
    }
}
