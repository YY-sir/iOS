//
//  Common.swift
//  snapkit-study
//
//  Created by Mac on 2021/1/15.
//

import Foundation
import UIKit
class Common: NSObject {
    @objc func LDColor(rgbValue:UInt, al:Float) -> UIColor {
        return UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0xFF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0xFF) / 255.0, alpha: CGFloat(al))

    }
//    @objc func maskImageWithColor(color : UIColor, float : CGFloat) -> UIImage{
//        UIGraphicsBeginImageContext(self.size)
//        color.setFill()
//        let bounds = CGRect.init(x:0, y:0, width: self.size.width, height: self.size.height)
//        UIRectFill(bounds)
//        self.draw(in: bounds, blendMode: CGBlendMode.destinationIn, alpha: float)
//        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return tintedImage!
//    }
}

