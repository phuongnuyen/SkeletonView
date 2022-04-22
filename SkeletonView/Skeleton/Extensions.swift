//
//  Extensions.swift
//  SkeletonView
//
//  Created by Phuong Nguyen Lan on 4/7/22.
//

import UIKit
import ObjectiveC

private var kEnableSkeleton = "kEnableSkeleton"
private var kSkeletonLayer = "kSkeletonLayer"
private var kSkeletonConfig = "kSkeletonConfig"

extension UIView {
    var enableSkeleton: Bool  {
        get {
            return objc_getAssociatedObject(self, &kEnableSkeleton) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, &kEnableSkeleton, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var skeletonLayer: SkeletonLayer? {
        get {
            return objc_getAssociatedObject(self, &kSkeletonLayer) as? SkeletonLayer
        }
        set {
            objc_setAssociatedObject(self, &kSkeletonLayer, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    var skeletonConfig: SkeletonConfig {
        get {
            return objc_getAssociatedObject(self, &kSkeletonConfig) as? SkeletonConfig ?? SkeletonConfig()
        }
        set {
            objc_setAssociatedObject(self, &kSkeletonConfig, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func startAnimation() {
        if self.subviews.isEmpty {
            startShimmer()
        }
        self.subviews.forEach { view in
            view.startAnimation()
        }
    }
    
    private func startShimmer() {
        if !enableSkeleton {
            return
        }
        if skeletonLayer == nil {
            self.layoutIfNeeded()
            self.clipsToBounds = true
            skeletonLayer = SkeletonLayer(skeletonConfig, holder: self)
            self.layer.cornerRadius = skeletonConfig.cornerRadius
        }
        layer.addSublayer(skeletonLayer!)
        let animation = SkeletonAnimationBuilder(skeletonConfig).makeAnimation()
        skeletonLayer?.add(animation, forKey: SkeletonAnimationBuilder.kShimmerAnimation)
    }
    
    func stopAnimation() {
        if self.subviews.isEmpty {
            stopShimmer()
        }
        self.subviews.forEach { view in
            view.stopAnimation()
        }
    }
    
    private func stopShimmer() {
        skeletonLayer?.removeAnimation(forKey: SkeletonAnimationBuilder.kShimmerAnimation)
        skeletonLayer?.removeFromSuperlayer()
        skeletonLayer = nil
    }
}

