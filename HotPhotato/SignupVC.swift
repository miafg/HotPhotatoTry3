//
//  SignupVC.swift
//  HotPhotato
//
//  Created by Mia Froehling-Gallier on 10/7/15.
//  Copyright © 2015 hotPhotato. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signupTapped(sender: AnyObject) {
        var usrEntered = txtUsername.text
        var pwdEntered = txtPassword.text
        if pwdEntered != txtConfirmPassword.text {
            self.messageLabel.text = "Passwords Do Not Match"
        }
        if usrEntered != "" && pwdEntered != "" {
        } else {
            self.messageLabel.text = "All Fields Required"
        }
    }

    @IBAction func gotoLogin(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
