//
//  SignInViewController.swift
//  instakev
//
//  Created by Kevin Asistores on 2/21/16.
//  Copyright © 2016 Kevin Asistores. All rights reserved.
//

import UIKit
import Parse

class SignInViewController: UIViewController {

    @IBOutlet weak var passWordField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var okayLabel: UIView!
    @IBOutlet weak var okButtonLabel: UIButton!
    @IBOutlet weak var singInLabel: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.singInLabel.layer.cornerRadius = 10.0
        self.okayLabel.hidden = true
        self.okayLabel.layer.cornerRadius = 10.0
        self.okayLabel.layer.borderWidth = 1.0
        self.okayLabel.layer.borderColor = UIColor.whiteColor().CGColor
        self.okButtonLabel.layer.cornerRadius = 10.0

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onSignUp(sender: AnyObject) {
            let newUser = PFUser()
            view.endEditing(true)
        
            newUser.email = emailField.text
            newUser.username = userNameField.text
            newUser.password = passWordField.text
            
            newUser.signUpInBackgroundWithBlock{(success: Bool, error: NSError?) -> Void in
                
                if let error = error {
                    print(error.localizedDescription)
                    if error.code == 202{
                        print("Username already taken!")
                    }
                }
                else {
                    print("created a user ajivnevnrve oh yeaa!")
                    
                    self.okayLabel.hidden = false
                }
            }
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
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
