//
//  SelectLocation.swift
//  TestApp
//
//  Created by Vasyl Travlinskyy on 06.07.2020.
//  Copyright © 2020 Vasyl Travlinskyy. All rights reserved.
//


import UIKit



protocol LocationsListDelegate: class {
    func selectLocationFromList(index: Int)
}

class LocationsList: UIView {
    
    private static let height = UICommon.setSize(origin: 150, add: 10, ipadMultiplier: 15)
    private let scrollView = UIScrollView()
    private var stackView = UIStackView ()
    private var buttons = [UIButton]()
    private var titles = [String]()
    weak var delegate: LocationsListDelegate?
    
    private func setCell() {
        
        for (index, title) in titles.enumerated() {
            let button = UIButton()
            button.contentHorizontalAlignment = .left
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button.tag = index
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 30).isActive = true
            button.setTitleColor(UICommon.colorLightBlack, for: .normal)
            button.setTitle(title, for: .normal)
            button.addTarget(self, action: #selector(action(sender:)), for: .touchUpInside)

            buttons.append(button)
        }
    }
    
    
    @objc func action(sender: UIButton) {
        delegate?.selectLocationFromList(index: sender.tag)
    }
    
    
    private func setStackView() {
        
        backgroundColor = UICommon.colorWhite
        layer.opacity = 1
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        
        stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 3
        
        scrollView.addSubview(stackView)
        addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    }
    
    
    func add(buttonTitles: [String]) {
        self.titles = buttonTitles
        self.setCell()
        self.setStackView()
    }
    
}



