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
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signupTapped(sender: AnyObject) {
        let usrEntered = txtUsername.text
        let pwdEntered = txtPassword.text
        let pwdConfirmEntered = txtConfirmPassword.text
        let emailEntered = txtEmail.text
        if usrEntered == "" && pwdEntered == "" && pwdConfirmEntered == "" && emailEntered == ""{
            self.messageLabel.text = "All Fields Required!"
        } else if usrEntered == "" {
            self.messageLabel.text = "Please enter username"
        } else if pwdEntered == "" {
            self.messageLabel.text = "Please enter a password"
        } else if pwdEntered != pwdConfirmEntered {
            self.messageLabel.text = "Passwords Do Not Match"
        } else if emailEntered == "" {
            self.messageLabel.text = "Please enter email address"
        } else {
            userSignUp()
        }
    }
    
    func userSignUp() {
        let user = PFUser()
        user.username = txtUsername.text
        user.password = txtPassword.text
        user.email = txtEmail.text
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if error == nil {
                // Hooray! Let them use the app now.
                self.messageLabel.text = "User Signed Up!";
            } else {
                // Show the errorString somewhere and let the user try again.
                //let errorString = error!.userInfo["error"] as? NSString
            }
        }
    }

    @IBAction func gotoLogin(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func userKeyBoardResignTouchDown(sender: AnyObject) {
        sender.resignFirstResponder()
    }
    
    @IBAction func userKeyBoardResignEnter(sender: AnyObject) {
        sender.resignFirstResponder()
    }
    
    @IBAction func pwdKeyBoardResignTouchDown(sender: AnyObject) {
        sender.resignFirstResponder()
    }
    
    @IBAction func pwdKeyBoardResignEnter(sender: AnyObject) {
        sender.resignFirstResponder()
    }
    
    @IBAction func pwdConfirmKeyBoardResignTouchDown(sender: AnyObject) {
        sender.resignFirstResponder()
    }
    
    @IBAction func pwdConfKBResignEnter(sender: AnyObject) {
        sender.resignFirstResponder()
    }
    
    @IBAction func emailKeyBoardResignTouchDown(sender: AnyObject) {
        sender.resignFirstResponder()
    }
  
    @IBAction func emailKeyBoardResignEnter(sender: AnyObject) {
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
