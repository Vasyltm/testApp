//
//  Medicine.swift
//  TestApp
//
//  Created by Vasyl Travlinskyy on 03.07.2020.
//  Copyright © 2020 Vasyl Travlinskyy. All rights reserved.
//

import UIKit

class Medicine: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        navigationController?.navigationBar.barStyle = .default
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(false)
        title = "Medicine"
        
      
       }
 

}
