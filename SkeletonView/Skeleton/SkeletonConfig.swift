//
//  SkeletonConfig.swift
//  SkeletonView
//
//  Created by Phuong Nguyen Lan on 4/7/22.
//

import Foundation
import UIKit

typealias ShimmerAnimationPoint = (from: CGPoint, to: CGPoint)

enum ShimmerAnimationDirection {
    case leftToRight
    case rightToLeft
    case topLeftToBottomRight
    
    var startPoint: ShimmerAnimationPoint {
        switch self {
        case .leftToRight:
            return (from: CGPoint(x: -1, y: 0.5), to: CGPoint(x: 1, y: 0.5))
            
        case .rightToLeft:
            return (from: CGPoint(x: 1, y: 0.5), to: CGPoint(x: -1, y: 0.5))
            
        case .topLeftToBottomRight:
            return (from: CGPoint(x: -1, y: -1), to: CGPoint(x: 1, y: 1))
        }
    }
    
    var endPoint: ShimmerAnimationPoint {
        switch self {
        case .leftToRight:
            return (from: CGPoint(x: 0, y: 0.5), to: CGPoint(x: 2, y: 0.5))
            
        case .rightToLeft:
            return (from: CGPoint(x: 2, y: 0.5), to: CGPoint(x: 0, y: 0.5))
            
        case .topLeftToBottomRight:
            return (from: CGPoint(x: 0, y: 0), to: CGPoint(x: 2, y: 2))
        }
    }
}

class SkeletonConfig {
    let cornerRadius: Double
    let colors: [CGColor]
    let colorAnchorPositions: [NSNumber] = [0, 0.5, 1 ]
    let direction:ShimmerAnimationDirection
    let duration: Double
    let shimmerSize: CGSize?
    
    init(_ cornerRadius: Double = 8.0,
         backgroundColor: UIColor = UIColor(from: 0xEFEFEF),
         shimmerColor: UIColor = UIColor(from: 0xD1D1D1),
         direction: ShimmerAnimationDirection = .leftToRight,
         duration: Double = 1.0,
         shimmerSize: CGSize? = nil
    ) {
        self.cornerRadius = cornerRadius
        self.colors = [backgroundColor.cgColor,
                       shimmerColor.cgColor,
                       backgroundColor.cgColor]
        self.direction = direction
        self.duration = duration
        self.shimmerSize = shimmerSize
    }
}
