//
//  SkeletonLayer.swift
//  SkeletonView
//
//  Created by Phuong Nguyen Lan on 4/7/22.
//

import Foundation
import UIKit

class SkeletonLayer: CAGradientLayer {
    static let id = "SkeletonLayer"
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(_ config: SkeletonConfig,
         holder: UIView) {
        super.init()
        
        name = SkeletonLayer.id
        startPoint = CGPoint(x: 0.0, y: 0.5)
        endPoint = CGPoint(x: 1.0, y: 0.5)
        colors = config.colors
        locations = config.colorAnchorPositions
        
        let posX = getPositionToWindow(holder).x
        var posY: CGFloat = 0
        var width = UIScreen.main.bounds.width
        var height = UIScreen.main.bounds.width
        
        if let shimmerSize = config.shimmerSize {
            width = shimmerSize.width <= 0 ? width : shimmerSize.width
            height = shimmerSize.height <= 0 ? height : shimmerSize.height
            posY = (holder.frame.height - shimmerSize.height) / 2
        }
        frame = CGRect(x: -posX,
                       y: posY,
                       width: width,
                       height: height)
    }
    
    func getPositionToWindow(_ holder: UIView) -> CGPoint {
        let position = holder.frame.origin
        guard let coordinatePosition = holder.superview?.convert(position, to: nil) else {
            return position
        }
        return coordinatePosition
    }
    
}
