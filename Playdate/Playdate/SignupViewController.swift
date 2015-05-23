//
//  SignupViewController.swift
//  Playdate
//
//  Created by Oscar Bjorkman on 5/22/15.
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
