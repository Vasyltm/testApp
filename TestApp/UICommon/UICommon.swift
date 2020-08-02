//
//  UICommon.swift
//  TestApp
//
//  Created by Vasyl Travlinskyy on 02.07.2020.
//  Copyright © 2020 Vasyl Travlinskyy. All rights reserved.
//

import UIKit

class UICommon {

    static let colorBackground = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
    static let colorBlue = #colorLiteral(red: 0.431372549, green: 0.4705882353, blue: 0.968627451, alpha: 1)
    static let colorWhite = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    static let colorBlack = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    static let colorLightBlack = #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1)
    static let colorGray = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    
    static var fontPoppinsBold_17: UIFont  {
        get {
            if screenWidth > 414 {
                return UIFont(name: "Poppins-Bold", size: 19)!
            } else {
                return UIFont(name: "Poppins-Bold", size: 17)!
            }
        }
    }
    
    static var fontPoppins_10: UIFont  {
        get {
            if screenWidth > 414 {
                return UIFont(name: "Poppins-Regular", size: 13)!
            } else {
                return UIFont(name: "Poppins-Regular", size: 10)!
            }
        }
    }
        
    static var fontPoppins_13: UIFont  {
        get {
            if screenWidth > 414 {
                return UIFont(name: "Poppins-Regular", size: 15)!
            } else {
                return UIFont(name: "Poppins-Regular", size: 13)!
            }
        }
    }
    
    static var fontPoppinsLight_13: UIFont  {
        get {
            if screenWidth > 414 {
                return UIFont(name: "Poppins-Light", size: 14)!
            } else {
                return UIFont(name: "Poppins-Light", size: 12)!
            }
        }
    }
       
         
    
    
    static let cornerRadius: CGFloat = 25
    
    static var screenWidth: CGFloat {
        get {
            if  UIDevice.current.orientation == .portrait ||  UIDevice.current.orientation == .portraitUpsideDown {
                if UIScreen.main.bounds.width < UIScreen.main.bounds.height {
                    return UIScreen.main.bounds.width
                } else {
                    return UIScreen.main.bounds.height
                }
            } else {
                if UIScreen.main.bounds.width < UIScreen.main.bounds.height {
                    return UIScreen.main.bounds.width
                } else {
                    return UIScreen.main.bounds.height
                }
            }
        }
    }
    
    
    static var screenHeight: CGFloat {
        get {
            if  UIDevice.current.orientation == .portrait ||  UIDevice.current.orientation == .portraitUpsideDown {
                if UIScreen.main.bounds.width < UIScreen.main.bounds.height {
                    return UIScreen.main.bounds.height
                } else {
                    return UIScreen.main.bounds.width
                }
            } else {
                if UIScreen.main.bounds.width < UIScreen.main.bounds.height {
                    return UIScreen.main.bounds.height
                } else {
                    return UIScreen.main.bounds.width
                }
            }
        }
    }
    
    
    static func setSize(origin: CGFloat, add: CGFloat, iphoneMultiplier: CGFloat = 1.7, ipadMultiplier: CGFloat = 3) -> CGFloat {

        if  UIDevice.current.orientation == .portrait ||  UIDevice.current.orientation == .portraitUpsideDown {
            switch screenWidth {
                case 375: return  origin + add
                case 414: return origin + (add * iphoneMultiplier)
                case let x where x > 414: return origin + (add * ipadMultiplier)
                default: return origin
            }
        } else if  UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight {
            switch screenHeight {
                case let y where y == 667 || y == 812 : return origin + add
                case let y where y == 736 || y == 896: return origin + (add * iphoneMultiplier)
                case let y where y > 896: return origin + (add * ipadMultiplier)
                default: return origin
            }
        } else {
            return origin
        }
        
    }

}


extension UIViewController {
    
    var statusBarHeight: CGFloat  {
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows
            statusBarHeight = window.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        return statusBarHeight
    }

}



extension UIView {
    
    func addDottedBottomLine() {
        if layer.sublayers != nil {
            for layer in layer.sublayers! {
                if layer.name == "dottedBorder" {
                    layer.removeFromSuperlayer()
                }
            }
        }
        
        let lineDashPattern: [NSNumber] = [4, 4]
        let lineDashWidth: CGFloat = 1.0
        
        
        let path = CGMutablePath()
        let shapeLayer = CAShapeLayer()
        shapeLayer.name = "dottedBorder"
        shapeLayer.lineWidth = lineDashWidth
        shapeLayer.strokeColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        shapeLayer.lineDashPattern = lineDashPattern
        path.addLines(between:  [CGPoint(x: 0, y: frame.size.height - 1),
                                 CGPoint(x: frame.size.width, y: frame.size.height - 1)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
        
    }
    
    
    func roundCorners(cornerRadius: Double, cornerOne: UIRectCorner, cornerTwo: UIRectCorner) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [cornerOne, cornerTwo], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    
    
}
