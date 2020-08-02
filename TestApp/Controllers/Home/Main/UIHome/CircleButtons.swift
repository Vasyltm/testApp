//
//  StackVIewCell.swift
//  TestApp
//
//  Created by Vasyl Travlinskyy on 03.07.2020.
//  Copyright © 2020 Vasyl Travlinskyy. All rights reserved.
//

import UIKit


struct CircleButtonsCell {
    var head = ""
    var discription = ""
    var image =  ""
    let pushToController: UIViewController?
}


protocol CircleButtonsDelegate: class {
    func navigate(index: Int)
}


class CircleButtons: UIView {
    
    static let circleHeight = UICommon.setSize(origin: 60, add: 10, ipadMultiplier: 4)
    private var stackView = UIStackView ()
    private var circleButtonsCells = [CircleButtonsCell]()
    private var buttons = [UIButton]()
    weak var delegate: CircleButtonsDelegate?
 
    private func setCell() {
        
        for (index, view) in circleButtonsCells.enumerated() {
            let button = UIButton()
            button.contentHorizontalAlignment = .center
            button.tag = index
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(action(sender:)), for: .touchUpInside)
    
            let sircleViewImage = UIImageView()
            sircleViewImage.image = UIImage(named: view.image)
            sircleViewImage.contentMode = .center
            sircleViewImage.backgroundColor = UICommon.colorWhite
            sircleViewImage.layer.cornerRadius = CircleButtons.circleHeight / 2
            sircleViewImage.layer.shadowRadius = 10
            sircleViewImage.layer.shadowOpacity = 0.2
            sircleViewImage.layer.shadowOffset = CGSize(width: 3, height: 3)
            button.addSubview(sircleViewImage)
            sircleViewImage.translatesAutoresizingMaskIntoConstraints = false
            sircleViewImage.topAnchor.constraint(equalTo: button.topAnchor).isActive = true
            sircleViewImage.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
            sircleViewImage.widthAnchor.constraint(equalToConstant: CircleButtons.circleHeight).isActive = true
            sircleViewImage.heightAnchor.constraint(equalToConstant: CircleButtons.circleHeight).isActive = true
            
            let labelHead = UILabel()
            labelHead.text = view.head
            labelHead.font = UICommon.fontPoppinsLight_13
            labelHead.textColor = UICommon.colorBlack
            labelHead.textAlignment = .center
            button.addSubview(labelHead)
            labelHead.translatesAutoresizingMaskIntoConstraints = false
            labelHead.topAnchor.constraint(equalTo: sircleViewImage.bottomAnchor, constant: 10).isActive = true
            labelHead.widthAnchor.constraint(equalTo: button.widthAnchor).isActive = true
            labelHead.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
            labelHead.heightAnchor.constraint(equalToConstant: 20).isActive = true
            
            let labelDiscription = UILabel()
            labelDiscription.numberOfLines = .max
            labelDiscription.text = view.discription
            labelDiscription.font = UICommon.fontPoppins_10
            labelDiscription.textColor = UICommon.colorGray
            labelDiscription.textAlignment = .center
            button.addSubview(labelDiscription)
            labelDiscription.translatesAutoresizingMaskIntoConstraints = false
            labelDiscription.topAnchor.constraint(equalTo: labelHead.bottomAnchor, constant: 4).isActive = true
            labelDiscription.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -5).isActive = true
            labelDiscription.widthAnchor.constraint(equalToConstant: CircleButtons.circleHeight).isActive = true
           labelDiscription.centerXAnchor.constraint(equalTo: sircleViewImage.centerXAnchor).isActive = true
          
            buttons.append(button)
        }
    }
    
    
    @objc func action(sender: UIButton) {
        delegate?.navigate(index: sender.tag)
    }
      

    private func setStackView() {
        
        stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    
    func add(cells: [CircleButtonsCell]) {
        self.circleButtonsCells = cells
        self.setCell()
        self.setStackView()
    }

}


