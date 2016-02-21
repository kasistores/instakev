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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginLabel.layer.cornerRadius = 10.0
        self.signInLabel.layer.cornerRadius = 10.0

        // Do any additional setup after loading the view.
    }

    @IBAction func onSignIn(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(userNameField.text!, password: passWordField.text!){ (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                print("Logged in!")
                self.performSegueWithIdentifier("LoginSegue", sender: nil)
            }
            else {
                print("User with username \"" + self.userNameField.text! + "\" does not exist")
            }
        }
    }
    
    @IBAction func onSignUp(sender: AnyObject) {
        let newUser = PFUser()
        
        newUser.username = userNameField.text
        newUser.password = passWordField.text
        
        newUser.signUpInBackgroundWithBlock{(success: Bool, error: NSError?) -> Void in
            
            if success {
                print("created a user ajivnevnrve oh yeaa!")
            }
            else {
                print(error?.localizedDescription)
                if error?.code == 202{
                    print("Username already taken!")
                }
            }
        }
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
