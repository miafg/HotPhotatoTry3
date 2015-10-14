//
//  AddFriendsVC.swift
//  HotPhotato
//
//  Created by Mia Froehling-Gallier on 10/12/15.
//  Copyright © 2015 hotPhotato. All rights reserved.
//

import UIKit

class AddFriendsVC: UITableViewController, UISearchBarDelegate {
    @IBOutlet weak var friendSearch: UISearchBar!

    var searchActive : Bool = false
    //var data = ["San Francisco","New York","San Jose","Chicago","Los Angeles","Austin","Seattle"]
    var filtered:[PFObject]!
    var data:[PFObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendSearch.delegate = self
        search()
        // Do any additional setup after loading the view.
    }

    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        search(searchText)
    }
    
    func search(searchText:String? = nil) {
        let query = PFQuery(className: "_User")
        if (searchText != nil && searchText != "") {
            print(searchText)
            query.whereKey("username", containsString: searchText)
            query.findObjectsInBackgroundWithBlock { (results, error) -> Void in
                self.data = results as? [PFObject]
                self.tableView.reloadData()
            }
        } else {
            //self.data = []
            self.tableView.reloadData()
        }
        
        
        //query.findObjectsInBackgroundWithBlock({ (objects: [AnyObject]!, error: NSError!) -> Void in
//            self.filtered.removeAll(keepCapacity:true)
//            for object in objects {
//                var user: PFUSer = object as PFUser
//                
//                var isFollowing: Bool
//                
//                if user.username != PFUser.currentUser()?.username {
//                    self.filtered.append(user.username)
//                    
//                }
//            }
//        })
        
//        query.findObjectsInBackgroundWithBlock({(objects: [AnyObject]?, error: NSError?) -> Void in
//            if (error != nil) {
//                if (objects?.count != 0) {
//                    self.filtered.removeAll(keepCapacity: true)
//                    for object in objects! {
//                        let user = object as! PFUser
//                
//                        if user.username != PFUser.currentUser()?.username {
//                            self.filtered.append(user.username!)
//                        }
//                    }
//                }
//                
//            }
//        })
        
//        if (filtered.count == 0) {
//            searchActive = false;
//        } else {
//            searchActive = true;
//        }
        return
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    
//    
    //override func queryForTable() -> PFQuery {
        //let query = PFQuery(className: "User")
        //if (objects?.count == 0) {
        ///    query.cachePolicy = PFCachePolicy.CacheThenNetwork
        //}
        //query.whereKey("username", containsString: friendSearch.text)
        //return query
    //}
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.data != nil) {
            return self.data.count
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cellIdentifier:String = "search_friend"
        let cell = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        let obj = self.data[indexPath.row]
        cell.textLabel!.text = obj["username"] as? String
        return cell
    }
//        if(searchActive){
//            
//            if let user = object?["username"] as? String {
//            //var current: PFUser = filtered[indexPath.row] as! PFUser
//                cell?.textLabel?.text = user
//            }
//        }
//        
//        return cell!;
//    }
//    
//    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
