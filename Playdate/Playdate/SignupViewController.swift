//
//  SignupViewController.swift
//  Playdate
//
//  Created by Oscar Bjorkman on 5/22/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit
import Parse
import Bolts

class SignupViewController: UIViewController {

    @IBOutlet var usernameField: UITextField!
    
    @IBOutlet var ageField: UITextField!
    
    @IBOutlet var locationField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBAction func signupButton(sender: AnyObject) {
        
        // check to see that all field are filled out
        
        if usernameField.text == "" || ageField.text == "" || locationField.text == "" || passwordField.text == "" {
            
            displayAlert("Error", message: "Please fill out all the fields")
            
        }
        else {
            
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))      // set size of indicator
            activityIndicator.center = self.view.center               // set location of indicator
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            view.addSubview(activityIndicator)   // add to view
            
            activityIndicator.startAnimating()    // start the indicator
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()    // stop allowing user to access view
            
            var user = PFUser()
            user.username = usernameField.text
            user.password = passwordField.text
            user["age"] = ageField.text
            user["location"] = locationField.text
            
            var errorMessage = "Please try again later"
            
            user.signUpInBackgroundWithBlock({ (success, error) -> Void in
                
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if error == nil {
                    
                    // Signup successful
                    
                    println("Signup successful")
                    
                    self.displayAlert("Signup Successful!", message: "You may now login")
                    self.performSegueWithIdentifier("jumpToLogin", sender: self)
                    
                }
                else {
                    
                    if let errorString = error!.userInfo?["error"] as? String {
                        
                        errorMessage = errorString
                        
                    }
                    
                    self.displayAlert("Failed Signup", message: errorMessage)
                    
                    println("Error in signup")
                    
                }
                
            })
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {         // resign keyboard when tap outside
        self.view.endEditing(true)
    }
    
    func displayAlert(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (ACTION) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        })))
        
        self.presentViewController(alert, animated: true, completion: nil)
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
