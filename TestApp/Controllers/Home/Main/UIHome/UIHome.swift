//
//  UIHome.swift
//  TestApp
//
//  Created by Vasyl Travlinskyy on 02.07.2020.
//  Copyright © 2020 Vasyl Travlinskyy. All rights reserved.
//

import UIKit


class UIHome {
    
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false 
        return view
    }()
    
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        if #available(iOS 11.0, *) {
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        }
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    

    
    //========================
    //      statusBar
    //========================
    
    let statusBarView: UIView = {
        let statusBarView = UIView()
        statusBarView.translatesAutoresizingMaskIntoConstraints = false

        statusBarView.backgroundColor = UICommon.colorBlue
        statusBarView.layer.zPosition = 1
        return statusBarView
    }()
    
    var statusBarHeightConstraint = NSLayoutConstraint()
   
    
    
    //========================
    //      headView
    //========================
    
    let headView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            view.layer.cornerRadius = UICommon.cornerRadius
        } else {
        }
        view.backgroundColor = UICommon.colorBlue
        return view
    }()
    
    
    let labelAppName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UICommon.colorWhite
        label.font = UICommon.fontPoppinsBold_17
        label.numberOfLines = 2
        label.text = "Medico"
        return label
    }()
    
    
    let buttonLocation: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Mumbai", for: .normal)
        button.setTitleColor(UICommon.colorWhite, for: .normal)
        button.titleLabel?.font = UICommon.fontPoppins_10
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -10)
        button.setImage(UIImage(named: "arrowDownWhite"), for: .normal)
        button.semanticContentAttribute = UIApplication.shared
        .userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
        return button
    }()
    
    
    let locationsListWrap: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = UICommon.cornerRadius
        if #available(iOS 11.0, *) {
            view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        } else {
        }
        view.backgroundColor = UICommon.colorGray
        view.layer.zPosition = 2
        view.layer.opacity = 0
        return view
    }()
    
    
    let locationsList: LocationsList = {
        let locationList = LocationsList()
        locationList.translatesAutoresizingMaskIntoConstraints = false
        locationList.layer.zPosition = 3
        locationList.layer.cornerRadius = 15
        locationList.layer.shadowRadius = 8
        locationList.layer.shadowOpacity = 0.15
        locationList.layer.shadowOffset = CGSize(width: 0, height: 0)
        return locationList
    }()
    
    
   
    //========================
    //     circleButtons
    //========================
    
    let circleButtons: CircleButtons  = {
        let stackView = CircleButtons()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    //========================
    //       overViews
    //========================
    
    let overviews: Overviews = {
        let overviews = Overviews()
        overviews.translatesAutoresizingMaskIntoConstraints = false
        return overviews
    }()
    
    
    
    //========================
    //        doctors
    //========================
    
    let labelDoctorsHeader: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UICommon.colorLightBlack
        label.font = UICommon.fontPoppinsLight_13
        label.text = "Doctors nearby you"
        return label
    }()
    
    
    let buttonSeeAllDoctors: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("See All", for: .normal)
        button.setTitleColor(UICommon.colorBlue, for: .normal)
        button.titleLabel?.font = UICommon.fontPoppins_13
        return button
    }()
    
    
    let doctorsWraper: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    //========================
    //       shareCode
    //========================
    
    let viewShareCode: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UICommon.colorWhite
        view.layer.cornerRadius = 10
        return view
    }()
    
    
    let imageShareCode: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "shareCode")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    let labelShareCode: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UICommon.colorLightBlack
        label.font = UICommon.fontPoppins_13
        label.text = "Share the Given code"
        label.numberOfLines = 2
        return label
    }()
    
    
    var buttonShareCode: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UICommon.colorLightBlack, for: .normal)
        button.titleLabel?.font = UICommon.fontPoppins_13
        button.layer.cornerRadius = 18
        button.layer.borderColor = #colorLiteral(red: 0.8705882353, green: 0.8705882353, blue: 0.8705882353, alpha: 1)
        button.layer.borderWidth = 1
        button.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        button.contentHorizontalAlignment = .left
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        return button
    }()
    
    
    private let buttonShareCodeImage: UIImageView = {
        let imagView = UIImageView()
        imagView.image = UIImage(named: "share")!.withRenderingMode(.alwaysTemplate)
        imagView.tintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        imagView.contentMode = .scaleAspectFit
        imagView.translatesAutoresizingMaskIntoConstraints = false
        return imagView
    }()
    
    
    
    
    
    
    func addHomeViews(to controller: UIViewController) {
     
        controller.view.addSubview(statusBarView)
        
        headView.addSubview(labelAppName)
        headView.addSubview(buttonLocation)
        contentView.addSubview(headView)
        contentView.addSubview(circleButtons)
        contentView.addSubview(overviews)
        contentView.addSubview(labelDoctorsHeader)
        contentView.addSubview(buttonSeeAllDoctors)
        contentView.addSubview(doctorsWraper)
        
        viewShareCode.addSubview(imageShareCode)
        viewShareCode.addSubview(labelShareCode)
        buttonShareCode.addSubview(buttonShareCodeImage)
        viewShareCode.addSubview(buttonShareCode)
        
        contentView.addSubview(viewShareCode)
        scrollView.addSubview(contentView)
        
        controller.view.addSubview(scrollView)
        
        controller.view.addSubview(locationsListWrap)
        
        statusBarView.topAnchor.constraint(equalTo: controller.view.topAnchor).isActive = true
        statusBarView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor).isActive = true
        statusBarView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor).isActive = true
        statusBarView.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor).isActive = true
        statusBarHeightConstraint = statusBarView.heightAnchor.constraint(equalToConstant: controller.statusBarHeight)
        statusBarHeightConstraint.isActive = true
        
        scrollView.topAnchor.constraint(equalTo: statusBarView.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor).isActive = true
        
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        headView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -2).isActive = true
        headView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        headView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        headView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        labelAppName.topAnchor.constraint(equalTo: headView.topAnchor, constant: 30).isActive = true
        labelAppName.leftAnchor.constraint(equalTo: headView.leftAnchor, constant: 30).isActive = true
        
        buttonLocation.topAnchor.constraint(equalTo: headView.topAnchor,constant: 27).isActive = true
        buttonLocation.trailingAnchor.constraint(equalTo: headView.trailingAnchor,constant: -30).isActive = true
        buttonLocation.heightAnchor.constraint(equalToConstant: 30).isActive = true

        locationsListWrap.topAnchor.constraint(equalTo: controller.view.topAnchor).isActive = true
        locationsListWrap.leftAnchor.constraint(equalTo: controller.view.leftAnchor).isActive = true
        locationsListWrap.rightAnchor.constraint(equalTo: controller.view.rightAnchor).isActive = true
        locationsListWrap.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor).isActive = true
        
        circleButtons.topAnchor.constraint(equalTo: headView.bottomAnchor, constant: -(CircleButtons.circleHeight / 2)).isActive = true
        circleButtons.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        circleButtons.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        overviews.topAnchor.constraint(equalTo: circleButtons.bottomAnchor, constant: 30).isActive = true
        overviews.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor).isActive = true
        overviews.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor).isActive = true
        
        labelDoctorsHeader.topAnchor.constraint(equalTo:overviews.bottomAnchor, constant: 40).isActive = true
        labelDoctorsHeader.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 15).isActive = true
        
        buttonSeeAllDoctors.centerYAnchor.constraint(equalTo: labelDoctorsHeader.centerYAnchor).isActive = true
        buttonSeeAllDoctors.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -40).isActive = true
        
        doctorsWraper.topAnchor.constraint(equalTo: labelDoctorsHeader.bottomAnchor).isActive = true
        doctorsWraper.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor).isActive = true
        doctorsWraper.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor).isActive = true
        doctorsWraper.heightAnchor.constraint(equalToConstant: UICommon.setSize(origin: 190, add: 10, ipadMultiplier: 6)).isActive = true
        
        viewShareCode.topAnchor.constraint(equalTo: doctorsWraper.bottomAnchor).isActive = true
        viewShareCode.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 15).isActive = true
        viewShareCode.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -15).isActive = true
        viewShareCode.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true
        
        imageShareCode.topAnchor.constraint(equalTo: viewShareCode.topAnchor, constant: 0).isActive = true
        imageShareCode.leadingAnchor.constraint(equalTo: viewShareCode.leadingAnchor).isActive = true
        imageShareCode.trailingAnchor.constraint(equalTo: viewShareCode.trailingAnchor).isActive = true
        imageShareCode.heightAnchor.constraint(equalToConstant: UICommon.setSize(origin: 220, add: 10, ipadMultiplier: 5)).isActive = true
        
        labelShareCode.topAnchor.constraint(equalTo: imageShareCode.bottomAnchor, constant: 10).isActive = true
        labelShareCode.leadingAnchor.constraint(equalTo: viewShareCode.leadingAnchor, constant: 10).isActive = true
        labelShareCode.widthAnchor.constraint(equalToConstant: 100).isActive = true
        labelShareCode.bottomAnchor.constraint(equalTo: viewShareCode.bottomAnchor, constant: -10).isActive = true
        
        buttonShareCode.topAnchor.constraint(equalTo: imageShareCode.bottomAnchor, constant: 10).isActive = true
        buttonShareCode.centerYAnchor.constraint(equalTo: labelShareCode.centerYAnchor).isActive = true
        buttonShareCode.leadingAnchor.constraint(equalTo: labelShareCode.trailingAnchor, constant: 20).isActive = true
        buttonShareCode.trailingAnchor.constraint(equalTo: viewShareCode.trailingAnchor, constant: -20).isActive = true
        
        buttonShareCodeImage.trailingAnchor.constraint(equalTo: buttonShareCode.trailingAnchor, constant: -18).isActive = true
        buttonShareCodeImage.centerYAnchor.constraint(equalTo: buttonShareCode.centerYAnchor).isActive = true
        
    }
    
    
}
