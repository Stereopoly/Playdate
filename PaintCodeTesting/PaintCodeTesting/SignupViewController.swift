//
//  SignupViewController.swift
//  PaintCodeTesting
//
//  Created by Oscar Bjorkman on 5/21/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var ageField: UITextField!
    @IBOutlet var locationField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBAction func signupButton(sender: AnyObject) {
        
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
