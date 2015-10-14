//
//  FriendsVC.swift
//  HotPhotato
//
//  Created by Mia Froehling-Gallier on 10/12/15.
//  Copyright © 2015 hotPhotato. All rights reserved.
//

import UIKit

class FriendsVC: PFQueryTableViewController {
    
    var user = PFUser.currentUser()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func queryForTable() -> PFQuery {
        let query = PFQuery(className: "User")
        if let user = PFUser.currentUser() {
            query.whereKey("friends", equalTo: user)
        }
        query.orderByAscending("username")
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let cellIdentifier:String = "FriendCell"
        var cell:PFTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? PFTableViewCell
        if (cell == nil) {
            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        }
        if let pfobject = object {
            cell?.textLabel?.text = pfobject["username"] as? String
        }
        return cell;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override init(style: UITableViewStyle, className: String?) {
//        super.init(style: style, className: "User")
//        self.pullToRefreshEnabled = true
//        self.paginationEnabled = false
//        self.parseClassName = "User"
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("NSCoding not supported")
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
