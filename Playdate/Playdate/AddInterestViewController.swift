//
//  AddInterestViewController.swift
//  Playdate
//
//  Created by Oscar Bjorkman on 5/26/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit

class AddInterestViewController: UIViewController {
    
    var interest:String = ""
    
    @IBOutlet var addInterestField: UITextField!
    
    @IBAction func addInterestButton(sender: AnyObject) {
        
        if (addInterestField.text == "" || addInterestField.text == " " && addInterestField.text != nil){
            println("nothing")
        }
        else {
        
            println(addInterestField.text)
            
//            addInterestField.text = interest
//            
//            println(interest)
            
            interests.append(addInterestField.text)
            
            println(interests)
            
            displayAlert("Interest Added!", message: "Successfully added interest")
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
