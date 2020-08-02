//
//  Main.swift
//  TestApp
//
//  Created by Vasyl Travlinskyy on 01.07.2020.
//  Copyright © 2020 Vasyl Travlinskyy. All rights reserved.
//

import UIKit

class Home: UIViewController {
    
   
    private let object = UIHome()
    
    private let circleButtons = [
        CircleButtonsCell(head: "Doctor", discription: "Search doctor around you", image: "doctor", pushToController: DoctorAround()),
        CircleButtonsCell(head: "Medicines", discription: "Order Medicine to home", image: "medicines", pushToController: Medicine()),
        CircleButtonsCell(head: "Diagnostic", discription: "Book test at Doorstep", image: "diagnostic", pushToController: Diagnostic())
    ]
    
    private lazy  var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 550, height: 550), collectionViewLayout: collectionViewLayout )
        return collectionView
    }()
    
    private var doctors = [
        Doctor(name: "Alina", surname: "James" , photo: "https://www.sport.ru/ai/29x16000/451789/head_0.jpg", about: "B.Sc, MBBS, DDVL, MD-Dermitologist", rate: 4.2),
        Doctor(name: "Steve", surname: "Robert", photo: "https://asseenbyjanineblog.com/wp-content/uploads/2011/02/Isaiah-Senior-Portrait-Head-Shot-DIY-Beauty-Dish-Canon-Speedlight.jpg", about: "about", rate: 3.6),
        Doctor(name: "Alina", surname: "James", photo: "https://i.xiaomi.ua/u/CatalogueImage/Dental-floss-DOCTOR-B-3pcs-to-50m-0025_19519_1519302401.jpg", about: "about", rate: 2.5),
        Doctor(name: "Alan Gayd", photo: "", about: "about", rate: 2)
    ]
    
    private var locations = ["Mumbai", "Delhi", "Kyiv", "Odesa", "Toronto", "Lviv", "Milan", "London", "Praga", "Mumbai", "Delhi", "Kyiv", "Odesa", "Toronto", "Lviv", "Milan", "London", "Praga"]
    
    private var sharedCode: String? = "NHDGH"
    
    private var viewTranslation = CGPoint(x: 0, y: 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        object.addHomeViews(to: self)
        
        object.buttonLocation.addTarget(self, action: #selector(openLocationsList(sender:)), for: .touchUpInside)
        
        object.locationsList.add(buttonTitles: locations)
        object.locationsList.delegate = self
        
        object.circleButtons.add(cells: circleButtons)
        object.circleButtons.delegate = self
        
        object.overviews.add(images: ["overviewOne", "overviewOne", "overviewOne", "overviewOne"])
        object.overviews.delegate = self
        
        drawCollectionView()
        
        object.buttonShareCode.setTitle(sharedCode, for: .normal)
        object.buttonShareCode.addTarget(self, action: #selector(shareCode(sender:)), for: .touchUpInside)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        navigationController?.navigationBar.isHidden = true
        let nav = self.navigationController?.navigationBar
        nav?.barTintColor = UICommon.colorBlue
        nav?.backgroundColor = UICommon.colorBlue
        nav?.isTranslucent = false
        nav?.tintColor = UICommon.colorWhite
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UICommon.colorWhite]
        nav?.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        nav?.shadowImage = UIImage()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        
        self.navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barStyle = .black
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
         
        self.view.layoutIfNeeded()
        
        object.statusBarHeightConstraint.constant = self.statusBarHeight
        object.imageShareCode.addDottedBottomLine()
        
        if #available(iOS 11.0, *) {
        } else {
            object.headView.roundCorners(cornerRadius: Double(UICommon.cornerRadius), cornerOne: .bottomLeft, cornerTwo: .bottomRight)
        }
    }
    
    
    @objc func shareCode(sender: UIButton) {
        let activitiViewCntroller = UIActivityViewController(activityItems: [self.sharedCode ?? ""], applicationActivities: nil)
        self.present(activitiViewCntroller, animated: true, completion: nil)
        if let popOver = activitiViewCntroller.popoverPresentationController {
          popOver.sourceView = self.view
        }
    }
    
    
    private func drawCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.register(DoctorCollectionViewCell.self, forCellWithReuseIdentifier: DoctorCollectionViewCell.reuseId)
        collectionView.dataSource = self
        collectionView.delegate = self
        self.object.doctorsWraper.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: self.object.doctorsWraper.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.object.doctorsWraper.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.object.doctorsWraper.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo:self.object.doctorsWraper.bottomAnchor).isActive = true
    }
    
    
}



extension Home: CircleButtonsDelegate {
    
    func navigate(index: Int) {
        if let controller = circleButtons[index].pushToController {
            self.navigationController?.pushViewController(controller, animated: false)
        }
    }
    
}



extension Home: OverviewsDelegate {
    
    func getOverviewIndex(index: Int) {
        let controller = Overview()
        controller.overviewName = "Overview №\(index)"
        self.navigationController?.pushViewController(controller, animated: false)
    }
    
}



extension Home: LocationsListDelegate {
    
    
    func selectLocationFromList(index: Int) {
        self.object.buttonLocation.setTitle(self.locations[index], for: .normal)
        hideLocationList()
    }
    
    
    private func hideLocationList() {
        
        UIView.animate(withDuration: 0.7) { [unowned self] in
            
            self.object.locationsListYAnchor.constant = UIScreen.main.bounds.height
            self.object.locationsListTopAnchor.constant = UIScreen.main.bounds.height
            self.object.locationsList.isHidden = true
            self.view.layoutIfNeeded()
            self.tabBarController?.tabBar.isUserInteractionEnabled = true
            self.object.locationsListWrap.layer.opacity = 0
        }
    }
    
    
    @objc private func openLocationsList(sender: UIButton) {
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))
        tabBarController?.tabBar.isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 0.7) { [unowned self] in
            self.object.locationsListWrap.layer.opacity = 0.4
            self.object.locationsList.isHidden = false
            self.object.locationsListYAnchor.constant = 0
            self.object.locationsListTopAnchor.constant = 80
            self.view.layoutIfNeeded()
        }
        
    }
    
    
    @objc private func handleDismiss(sender: UIPanGestureRecognizer) {
        
        switch sender.state {
            case .changed:
                viewTranslation = sender.translation(in: view)
                UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: { [unowned self] in
                    self.object.locationsList.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
                })
            case .ended:
                if viewTranslation.y < 210 {
                    UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: { [unowned self] in
                        self.object.locationsList.transform = .identity
                    })
                } else { 
                    self.object.locationsList.transform = .identity
                    hideLocationList()
            }
            default: break
        }
        
    }
    
    
}



extension Home: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return doctors.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoctorCollectionViewCell.reuseId, for: indexPath) as! DoctorCollectionViewCell
        
        let url = URL(string: doctors[indexPath.row].photo)
        DispatchQueue.global().async {
            guard url != nil else {
                return
            }
            do {
                let data = try Data(contentsOf: url! )
                DispatchQueue.main.async {
                    cell.photo.image = UIImage(data: data)
                }
            } catch {
                DispatchQueue.main.async {
                    cell.photo.image = UIImage(named: "noPhoto")
                }
            }
        }
        
        cell.labelDoctorName.text = "Dr. " + doctors[indexPath.row].fullName
        cell.labelDoctorAbout.text  = doctors[indexPath.row].about
        cell.labelRate.text = String(doctors[indexPath.row].rate)
        
        cell.buttonAction.accessibilityIdentifier = cell.labelDoctorName.text ?? ""
        cell.buttonAction.addTarget(self, action: #selector(chooseDoctor(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    
    @objc func chooseDoctor(sender: UIButton) {
        let controller = DoctorAbout()
        controller.doctorName = sender.accessibilityIdentifier
        self.navigationController?.pushViewController(controller, animated: false)
    }
    
}



extension Home: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat  {
            get {
                if UICommon.screenWidth > 414 {
                    return UICommon.screenWidth / 3.5
                } else {
                    return UICommon.screenWidth / 3
                }
            }
            
        }
        return CGSize(width: width, height: collectionView.frame.height - 40)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
    
    
}

