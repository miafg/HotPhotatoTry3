//
//  ViewController.swift
//  HotPhotato
//
//  Created by Mia Froehling-Gallier on 10/7/15.
//  Copyright © 2015 hotPhotato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var usernameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        if (PFUser.currentUser() == nil) {
            self.performSegueWithIdentifier("goto_login", sender: self)
        } else {
            self.performSegueWithIdentifier("goto_MainNav", sender: self)
        }
        
    }
    
    @IBAction func logoutTapped(sender: UIButton) {
        self.performSegueWithIdentifier("goto_login", sender: self)
        
    }

}

