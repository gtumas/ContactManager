//
//  ContactEditVC.swift
//  ContactManager
//
//  Created by Gytis on 15/06/16.
//  Copyright © 2016 Mediapark. All rights reserved.
//

import UIKit

protocol ContactEditProtocol: class {
    func sendDataBack(contact: Contact)
    //func didFinishTask(sender: DetailViewController)
}

class ContactEditVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    
    var contact : Contact!
    weak var delegate: ContactEditProtocol?
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var datePicker: UIDatePicker!
    

    override func viewDidLoad() {
        datePicker.hidden = true
        datePicker.backgroundColor = UIColor.whiteColor()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        let cell: UITableViewCell
        
        switch row {
        case 0:
            cell = tableView.dequeueReusableCellWithIdentifier("NameCell", forIndexPath:indexPath) as UITableViewCell
            let label = cell.viewWithTag(1) as? UILabel
            label?.text = "Name"
            let textField = cell.viewWithTag(2) as? UITextField
            textField?.text = contact.name
            
        case 1:
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .MediumStyle
            
            cell = tableView.dequeueReusableCellWithIdentifier("DateCell", forIndexPath:indexPath) as UITableViewCell
            let label = cell.viewWithTag(1) as? UILabel
            label?.text = "Birthday"
            let textField = cell.viewWithTag(2) as? UITextField
            let dateBday = contact.birthday
            textField?.text = dateFormatter.stringFromDate(dateBday)
            //textField?.text = "sss"
            
        case 2:
            cell = tableView.dequeueReusableCellWithIdentifier("NameCell", forIndexPath:indexPath) as UITableViewCell
            let label = cell.viewWithTag(1) as? UILabel
            label?.text = "Email"
            let textField = cell.viewWithTag(2) as? UITextField
            textField?.text = contact.email
            
        case 3:
            cell = tableView.dequeueReusableCellWithIdentifier("NameCell", forIndexPath:indexPath) as UITableViewCell
            let label = cell.viewWithTag(1) as? UILabel
            label?.text = "Salary"
            let textField = cell.viewWithTag(2) as? UITextField
            textField?.text = ("\(contact.salary)")
            
        case 4:
            
            let genderString: String
            switch contact.gender {
            case 1:
                genderString = "Male"
            case 2:
                genderString = "Female"
            default:
                genderString = "N/A"
            }
            
            cell = tableView.dequeueReusableCellWithIdentifier("NameCell", forIndexPath:indexPath) as UITableViewCell
            let label = cell.viewWithTag(1) as? UILabel
            label?.text = "Gender"
            let textField = cell.viewWithTag(2) as? UITextField
            textField?.text = genderString
            
        default:
            cell = tableView.dequeueReusableCellWithIdentifier("NameCell", forIndexPath:indexPath) as UITableViewCell
        }
        
        return cell
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print ("called tf begin edit")
        datePicker.hidden = false
    }
    
    
    @IBAction func doneClicked (sender: AnyObject){
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func cancelClicked (sender: AnyObject){
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBAction func dateDidChange (sender : UIDatePicker){
        
        let date = sender.date
        contact.birthday = date;
        tableView.reloadData()
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

}
