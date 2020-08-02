//
//  stackViewOverviews.swift
//  TestApp
//
//  Created by Vasyl Travlinskyy on 03.07.2020.
//  Copyright © 2020 Vasyl Travlinskyy. All rights reserved.
//


import UIKit



protocol OverviewsDelegate: class {
    func getOverviewIndex(index: Int)
}

class Overviews: UIView {
    
    private static let height = UICommon.setSize(origin: 150, add: 10, ipadMultiplier: 15)
    private let scrollView = UIScrollView()
    private var stackView = UIStackView ()
    private var overviews = [String]()
    private var buttons = [UIButton]()
    weak var delegate: OverviewsDelegate?
    
    private func setCell() {
        
        for (index, view) in overviews.enumerated() {
            
            let button = UIButton()
            button.tag = index
            button.addTarget(self, action: #selector(action(sender:)), for: .touchUpInside)

            let sircleViewImage = UIImageView()
            sircleViewImage.image = UIImage(named: view)
            sircleViewImage.contentMode = .scaleAspectFill
            sircleViewImage.layer.cornerRadius = 12
            sircleViewImage.layer.borderWidth = 1
            sircleViewImage.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            sircleViewImage.clipsToBounds = true
            button.addSubview(sircleViewImage)
            sircleViewImage.translatesAutoresizingMaskIntoConstraints = false
            sircleViewImage.topAnchor.constraint(equalTo: button.topAnchor).isActive = true
            sircleViewImage.leadingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
            sircleViewImage.bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
            sircleViewImage.trailingAnchor.constraint(equalTo: button.trailingAnchor).isActive = true
            sircleViewImage.widthAnchor.constraint(equalToConstant: UICommon.screenWidth - 40).isActive = true
            sircleViewImage.heightAnchor.constraint(equalToConstant: Overviews.height).isActive = true

            buttons.append(button)
        }
    }
    
    
    @objc func action(sender: UIButton) {
        delegate?.getOverviewIndex(index: sender.tag)
    }
    
    
    private func setStackView() {
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        
        stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        
        scrollView.addSubview(stackView)
        addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
    }
    
    
    func add(images: [String]) {
        self.overviews = images
        self.setCell()
        self.setStackView()
    }
    
}



