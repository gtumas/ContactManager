//
//  ViewController.swift
//  ContactManager
//
//  Created by Gytis on 15/06/16.
//  Copyright © 2016 Mediapark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    @IBOutlet var emailLabel : UILabel!
    @IBOutlet var salaryLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    
    var contact: Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentDate = NSDate()
        contact = Contact(name: "Adam Bob", birthday: currentDate, email: "adam@bob.com", salary: 40000, gender: 1)
       
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        
        let genderString: String
        switch contact.gender {
        case 1:
            genderString = "Male"
        case 2:
            genderString = "Female"
        default:
            genderString = "N/A"
        }
        
        
        nameLabel.text = contact.name
        birthdayLabel.text = dateFormatter.stringFromDate(contact.birthday)
        emailLabel.text = contact.email
        salaryLabel.text = "\(contact.salary)"
        genderLabel.text = genderString
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ContactEditSegue" {
            let navVC = segue.destinationViewController as! UINavigationController
            let contactEditVC = navVC.topViewController as! ContactEditVC
            contactEditVC.contact = self.contact
        }
        
    }

}

