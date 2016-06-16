//
//  Contact.swift
//  ContactManager
//
//  Created by Gytis on 15/06/16.
//  Copyright © 2016 Mediapark. All rights reserved.
//

import Foundation

class Contact {
    
    
    var name : String
    var birthday: NSDate
    var email : String
    var salary : Double
    var gender : Int
    
    init(name: String, birthday: NSDate, email: String, salary: Double, gender: Int){
        self.name = name
        self.birthday = birthday
        self.email = email
        self.salary = salary
        self.gender = gender
    }
    
}