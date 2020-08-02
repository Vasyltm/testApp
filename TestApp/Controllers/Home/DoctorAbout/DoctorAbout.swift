//
//  DoctorAbout.swift
//  TestApp
//
//  Created by Vasyl Travlinskyy on 06.07.2020.
//  Copyright © 2020 Vasyl Travlinskyy. All rights reserved.
//

import UIKit

class DoctorAbout: UIViewController {
    
    var doctorName: String?

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        title = doctorName
    }

   

}
