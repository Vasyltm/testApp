//
//  Overview.swift
//  TestApp
//
//  Created by Vasyl Travlinskyy on 07.07.2020.
//  Copyright © 2020 Vasyl Travlinskyy. All rights reserved.
//

import UIKit

class Overview: UIViewController {

    var overviewName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        title = overviewName
    }

}
