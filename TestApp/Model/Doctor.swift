//
//  Doctor.swift
//  TestApp
//
//  Created by Vasyl Travlinskyy on 05.07.2020.
//  Copyright © 2020 Vasyl Travlinskyy. All rights reserved.
//

import Foundation


struct Doctor {
    
    var name: String = ""
    var surname: String = ""
    var fullName: String {
        return name + " " + surname
    }
    var photo: String = ""
    var about: String = ""
    var rate: Float = 0
    
}
