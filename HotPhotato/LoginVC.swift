//
//  LoginVC.swift
//  HotPhotato
//
//  Created by Mia Froehling-Gallier on 10/7/15.
//  Copyright © 2015 hotPhotato. All rights reserved.
//

import UIKit
import Foundation

class LoginVC: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var loginMsgTxt: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signinTapped(sender: UIButton) {
        let usrEntered = txtUsername.text
        let pwdEntered = txtPassword.text
        //Authentication Code
        if usrEntered != "" && pwdEntered != "" {
            // Login the user
            PFUser.logInWithUsernameInBackground(usrEntered!, password: pwdEntered!) {
                (user: PFUser?, error: NSError?) -> Void in
                if user != nil {
                    dispatch_async(dispatch_get_main_queue()) {
                        self.performSegueWithIdentifier("signInToNavigation", sender: self)
                    }
                } else {
                    if let message: AnyObject = error!.userInfo["error"] {
                        self.loginMsgTxt.text = "\(message)"
                    }
                }
            }
        } else if usrEntered == "" {
            // Empty, Notify user
            self.loginMsgTxt.text = "Username required!"
        } else if pwdEntered == "" {
            self.loginMsgTxt.text = "Password Required!"
        } else {
            self.loginMsgTxt.text = "Both fields Required!"
        }
    }
    
    @IBAction func userKeyBoardResignTouch(sender: AnyObject) {
        sender.resignFirstResponder()

    }
    @IBAction func userKeyBoardResignEnter(sender: AnyObject) {
        sender.resignFirstResponder()
    }
    @IBAction func pwdKeyBoardResignTouch(sender: AnyObject) {
        sender.resignFirstResponder()
    }
    @IBAction func pwdKeyBoardResignEnter(sender: AnyObject) {
        sender.resignFirstResponder()
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
