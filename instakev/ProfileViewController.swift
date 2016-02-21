//
//  ProfileViewController.swift
//  instakev
//
//  Created by Kevin Asistores on 2/18/16.
//  Copyright © 2016 Kevin Asistores. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    @IBOutlet weak var logoutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = PFUser.currentUser()?.username
        self.logoutButton.layer.cornerRadius = 10.0
        
        
        self.tabBarController!.tabBar.tintColor = UIColor.whiteColor()
        self.tabBarController?.tabBar.backgroundColor = UIColor.blackColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogout(sender: AnyObject) {
        PFUser.logOut()
        PFUser.logOutInBackground()
        self.performSegueWithIdentifier("LogoutSegue", sender: nil)
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
