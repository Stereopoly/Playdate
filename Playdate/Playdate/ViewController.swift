//
//  ViewController.swift
//  Playdate
//
//  Created by Oscar Bjorkman on 5/22/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit
import Parse
import Bolts

var loggedIn:Bool = false

class ViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet var usernameField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
    
    @IBAction func loginButton(sender: AnyObject) {
        
        var errorMessage = "Please try again later"
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        
        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))      // set size of indicator
        activityIndicator.center = self.view.center               // set location of indicator
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(activityIndicator)   // add to view
        
        activityIndicator.startAnimating()    // start the indicator
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()    // stop allowing user to access view
        
        PFUser.logInWithUsernameInBackground(usernameField.text, password: passwordField.text) { (user, error) -> Void in
            
            activityIndicator.stopAnimating()
            UIApplication.sharedApplication().endIgnoringInteractionEvents()
            
            if user != nil {
                
                // Logged in
                
                println("Logged in")
                
                PFUser.currentUser()!.fetch()
                
                self.performSegueWithIdentifier("jumpToProfile", sender: self)
                
            }
            else {
                
                if let errorString = error!.userInfo?["error"] as? String {
                    
                    errorMessage = errorString
                    
                }
                
                self.displayAlert("Failed Login", message: errorMessage)
                
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var currentUser = PFUser.currentUser()
        
        if currentUser != nil {
            performSegueWithIdentifier("jumpToProfile", sender: self) // go directly to profile if logged in before
        }
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


}

