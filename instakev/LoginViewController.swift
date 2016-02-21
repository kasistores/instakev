//
//  LoginViewController.swift
//  instakev
//
//  Created by Kevin Asistores on 2/17/16.
//  Copyright © 2016 Kevin Asistores. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passWordField: UITextField!
    @IBOutlet weak var loginLabel: UIButton!
    @IBOutlet weak var signInLabel: UIButton!
    @IBOutlet weak var existLabel: UIView!
    @IBOutlet weak var okButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.existLabel.hidden = true
        
        self.existLabel.layer.cornerRadius = 10.0
        self.existLabel.layer.borderWidth = 1.0
        self.existLabel.layer.borderColor = UIColor.whiteColor().CGColor
        self.okButtonLabel.layer.cornerRadius = 10.0

        
        self.loginLabel.layer.cornerRadius = 10.0
        self.signInLabel.layer.cornerRadius = 10.0

        // Do any additional setup after loading the view.
    }

    @IBAction func onSignIn(sender: AnyObject) {
        
        let username = userNameField.text
        let password = passWordField.text
        
        
        PFUser.logInWithUsernameInBackground(username!, password: password!){ (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                print("Logged in!")
                self.performSegueWithIdentifier("LoginSegue", sender: nil)
            }
            else {
                print("User with username \"" + self.userNameField.text! + "\" does not exist")
                self.existLabel.hidden = false
            }
        }
        
        
    }
    
    @IBAction func hidebutton(sender: AnyObject) {
        self.existLabel.hidden = true
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        segue.destinationViewController
    }


}
