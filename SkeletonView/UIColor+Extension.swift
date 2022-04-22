//
//  UIColor+Extension.swift
//  SkeletonView
//
//  Created by Phuong Nguyen Lan on 4/7/22.
//

import UIKit

extension UIColor {
    convenience init(from hexValue: Int, alpha: Double = 1.0) {
        let redValue = Double((hexValue & 0xFF0000) >> 16)
        let greenValue = Double((hexValue & 0x00FF00) >> 8)
        let blueValue = Double((hexValue & 0x0000FF) >> 0)
        self.init(red: redValue / 255,
                  green: greenValue / 255,
                  blue: blueValue / 255,
                  alpha: alpha)
    }
}
