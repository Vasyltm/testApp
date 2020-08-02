//
//  ViewController.swift
//  TestApp
//
//  Created by Vasyl Travlinskyy on 05.07.2020.
//  Copyright © 2020 Vasyl Travlinskyy. All rights reserved.
//

import UIKit

class DoctorCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "CollectionViewCell"
    
    var id: Int?
    
    private static var photoSize: CGFloat {
        return UICommon.setSize(origin: 45, add: 10, ipadMultiplier: 5)
    }
    
    
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UICommon.colorWhite
        view.layer.cornerRadius = 10
        view.layer.shadowRadius = 8
        view.layer.shadowOpacity = 0.15
        view.layer.shadowOffset = CGSize(width: 0, height: 6)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let buttonAction: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    var photo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.image = UIImage(named: "noPhoto")
        imageView.backgroundColor = UICommon.colorGray
        imageView.layer.cornerRadius = photoSize / 2
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    var labelDoctorName: UILabel = {
        let label = UILabel()
        label.font = UICommon.fontPoppins_10
        label.textColor = UICommon.colorLightBlack
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var labelDoctorAbout: UILabel = {
        let label = UILabel()
        label.font = UICommon.fontPoppins_10
        label.textColor = UICommon.colorGray
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let rateIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rateStar")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    var labelRate: UILabel = {
        let label = UILabel()
        label.font = UICommon.fontPoppins_10
        label.textColor = UICommon.colorGray
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

       
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(cellView)
        contentView.addSubview(photo)
        contentView.addSubview(labelDoctorName)
        contentView.addSubview(labelDoctorAbout)
        contentView.addSubview(rateIcon)
        contentView.addSubview(labelRate)
        contentView.addSubview(buttonAction)
        
        cellView.topAnchor.constraint(equalTo: topAnchor, constant: 27).isActive = true
        cellView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        cellView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        cellView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        buttonAction.topAnchor.constraint(equalTo: topAnchor).isActive = true
        buttonAction.leftAnchor.constraint(equalTo: cellView.leftAnchor).isActive = true
        buttonAction.rightAnchor.constraint(equalTo: cellView.rightAnchor).isActive = true
        buttonAction.bottomAnchor.constraint(equalTo: labelDoctorName.bottomAnchor).isActive = true
        
        photo.topAnchor.constraint(equalTo: topAnchor).isActive = true
        photo.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        photo.heightAnchor.constraint(equalToConstant: DoctorCollectionViewCell.photoSize).isActive = true
        photo.widthAnchor.constraint(equalToConstant: DoctorCollectionViewCell.photoSize).isActive = true
        
        labelDoctorName.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 14).isActive = true
        labelDoctorName.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 12).isActive = true
        labelDoctorName.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -5).isActive = true
       
        labelDoctorAbout.topAnchor.constraint(equalTo: labelDoctorName.bottomAnchor, constant: 5).isActive = true
        labelDoctorAbout.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 12).isActive = true
        labelDoctorAbout.trailingAnchor.constraint(equalTo: cellView.trailingAnchor).isActive = true
        
        rateIcon.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10).isActive = true
        rateIcon.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -12).isActive = true
        rateIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        rateIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        labelRate.leadingAnchor.constraint(equalTo: rateIcon.trailingAnchor, constant: 5).isActive = true
        labelRate.centerYAnchor.constraint(equalTo: rateIcon.centerYAnchor).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

