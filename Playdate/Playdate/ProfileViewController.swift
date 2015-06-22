//
//  ProfileViewController.swift
//  Playdate
//
//  Created by Oscar Bjorkman on 5/24/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit
import Parse
import Bolts

var interests:[String] = []

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var locationLabel: UILabel!
    
    @IBOutlet var tableView: UITableView!
    
    let textCellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if loggedIn == false {
            
            performSegueWithIdentifier("segueProfileToLogin", sender: self)    // if not logged in and somehow got to profile page
            
        }
        if loggedIn == true {
            
            nameLabel.text = PFUser.currentUser()?.username
            locationLabel.text = ""
        
            tableView.delegate = self
            tableView.dataSource = self
        
            self.tableView.reloadData()
        
        }
        else {
            println("Error with loggedIn bool")
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interests.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = interests[indexPath.row]
        
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {     // updates table view after adding items
        self.tableView.reloadData()
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
