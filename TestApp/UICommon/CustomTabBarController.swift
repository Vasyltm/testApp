//
//  knTabController.swift
//  TestApp
//
//  Created by Vasyl Travlinskyy on 01.07.2020.
//  Copyright © 2020 Vasyl Travlinskyy. All rights reserved.
//
import UIKit


class CustomTabBarController: UITabBarController {
    
    let custmTabBarView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        if #available(iOS 11.0, *) {
            view.layer.cornerRadius = UICommon.cornerRadius
            view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        } 
        view.clipsToBounds = true
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: -4.0)
        view.layer.shadowOpacity = 0.07
        view.layer.shadowRadius = 4.0
        view.backgroundColor = UICommon.colorWhite
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(custmTabBarView)
        view.bringSubviewToFront(tabBar)
        
        tabBar.tintColor = UICommon.colorBlue
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.7333333333, green: 0.7333333333, blue: 0.7333333333, alpha: 1)
        tabBar.sizeToFit()
        tabBar.backgroundColor = .clear
        tabBar.backgroundImage = UIImage.from(color: .clear)
        tabBar.shadowImage = UIImage()
        tabBar.clipsToBounds = true
    }
    
    
    
    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
        
        self.view.layoutIfNeeded()
  
        if #available(iOS 11.0, *) {
        } else {
            custmTabBarView.roundCorners(cornerRadius: Double(UICommon.cornerRadius), cornerOne: .topLeft, cornerTwo: .topRight)
        }
        
        custmTabBarView.frame = tabBar.frame
        custmTabBarView.frame.size.height = tabBar.frame.size.height + 10
        custmTabBarView.frame.origin.y = tabBar.frame.origin.y - 10
      
        
        guard tabBar.items != nil else {
            return
        }
        
        
        if UIScreen.main.bounds.width < UIScreen.main.bounds.height {
            for item in tabBar.items! {
                item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
                item.imageInsets = UIEdgeInsets(top: -4, left: 0, bottom: 4, right: 0)
            }
        } else {
            for item in tabBar.items! {
                item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0)
                item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }
        }
        
    }
    
    
}


extension UIImage {
    static func from(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
