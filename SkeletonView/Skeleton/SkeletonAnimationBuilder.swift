//
//  SkeletonBuilder.swift
//  SkeletonView
//
//  Created by Phuong Nguyen Lan on 4/7/22.
//

import Foundation
import UIKit

class SkeletonAnimationBuilder {
    static let kShimmerAnimation = "ShimmerAnimation"
    let config: SkeletonConfig
    
    init(_ config: SkeletonConfig) {
        self.config = config
    }
    
    func makeAnimation() -> CAAnimation {
        let startPointAnim = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.startPoint))
        startPointAnim.fromValue = config.direction.startPoint.from
        startPointAnim.toValue = config.direction.startPoint.to
        
        let endPointAnim = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.endPoint))
        endPointAnim.fromValue = config.direction.endPoint.from
        endPointAnim.toValue = config.direction.endPoint.to
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = [startPointAnim, endPointAnim]
        animGroup.duration = config.duration
        animGroup.timingFunction = CAMediaTimingFunction(name: .linear)
        animGroup.repeatCount = .infinity
        animGroup.autoreverses = false
        animGroup.isRemovedOnCompletion = false
        return animGroup
    }
}
