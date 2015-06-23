//
//  AddInterestViewController.swift
//  Playdate
//
//  Created by Oscar Bjorkman on 5/26/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit
import Parse
import Bolts

class AddInterestViewController: UIViewController {
    
    var interest:String = ""
    
    @IBOutlet var addInterestField: UITextField!
    
    @IBOutlet var interestAdded: UILabel!
    
    @IBAction func interestFieldChange(sender: AnyObject) {     // added interest notification goes away after editing again
        
        interestAdded.hidden = true
        
    }
    @IBAction func addInterestButton(sender: AnyObject) {
        
        if (addInterestField.text == "" || addInterestField.text == " " && addInterestField.text != nil){
            println("nothing")
            interestAdded.text = "Please enter an interest"
            interestAdded.hidden = false
        }
        else {
        
            println(addInterestField.text)
            
//            addInterestField.text = interest
//            
//            println(interest)
            
            interests.append(addInterestField.text)
            
            println(interests)
            
            interestAdded.text = "Interest added!"
            interestAdded.hidden = false
            
      //      PFUser.currentUser()!["interests"]
            
            if let userInterestData: AnyObject = PFUser.currentUser()!["interests"] {
                println(userInterestData)
            }
            
//            displayAlert("Interest Added!", message: "Successfully added interest")
            
            PFUser.currentUser()!.fetch()    // update user
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        interestAdded.hidden = true
        
        if PFUser.currentUser() == nil {
            performSegueWithIdentifier("segueToLogin", sender: self)
        }
        else {
            PFUser.currentUser()!.fetch()    // update user
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
