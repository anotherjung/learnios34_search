//
//  loginViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Fomp on 8/26/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation
import UIKit
import Parse

class loginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var validationLabel: UILabel!
    
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func loginBtn(sender: UIButton) {
        print(user);
        
        
        PFUser.logInWithUsernameInBackground(usernameField.text, password:passwordField.text) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                // Do stuff after successful login.
                self.performSegueWithIdentifier("loginSeque", sender: self)
            } else {
                self.validationLabel.text = "Yo Try again"
                // The login failed. Check error to see why.
            }
        }
        
        
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