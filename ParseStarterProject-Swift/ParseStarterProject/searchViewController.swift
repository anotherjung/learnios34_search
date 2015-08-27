//
//  searchViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Fomp on 8/27/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import Foundation
import UIKit
import Parse

class searchViewController: UITableViewController {
    
    weak var cancelButtonDelegate: CancelButtonDelegate?

    
    @IBAction func cancelBarButtonPressed(sender: UIBarButtonItem) {
        print(CancelButtonDelegate)
        //CancelButtonDelegate?.cancelButtonPressedFrom(self)
    }
  
    
    var missions = ["live","hawaii"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var query = PFQuery(className:"_User")
        query.whereKeyExists("username")
        
        //var missions = query.findObjectsInBackground()
        println("me")
        println(missions)
        
        query.findObjectsInBackgroundWithBlock ( {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if error == nil && objects != nil { println("here") } else { println(error) }
            var missions: [String] = []
            for obj in objects! {
                missions.append(obj["username"] as! String)
                println(missions)
                self.tableView.reloadData()
            }
        }
    )
}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell: AnyObject = tableView.dequeueReusableCellWithIdentifier("MissionCell")!
        cell.textLabel!!.text = missions[indexPath.row]
        return cell as! UITableViewCell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missions.count
    }

    
}


