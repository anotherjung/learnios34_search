//
//  registerViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Fomp on 8/27/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation
import Parse

class registerViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func confirmBtn(sender: UIButton) {
        myMethod()
    }
    
    
    func myMethod() {
        var user = PFUser()
        user.username = emailField.text
        user.password = passwordField.text
        user.email = emailField.text
        // other fields can be set just like with PFObject
        //user["firstName"] = fnameField.text
        //user["lastName"] = lnameField.text
        //user["gender"] = genderField.text
        //user["birthdate"] = dateField.text
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo?["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
            } else {
                // Hooray! Let them use the app now.
                print(user)
            }
        }
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
