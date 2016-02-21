//
//  ComposeViewController.swift
//  instakev
//
//  Created by Kevin Asistores on 2/17/16.
//  Copyright © 2016 Kevin Asistores. All rights reserved.
//

import UIKit
import Parse

class ComposeViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postField: UITextField!
    
    let vc = UIImagePickerController()
    let vc2 = UIImagePickerController()
    
    @IBOutlet weak var photo: UIButton!
    @IBOutlet weak var library: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var postButton: UIButton!
    
    var label = UILabel(frame: CGRectMake(0, 0, 200, 41))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backButton.layer.cornerRadius = self.backButton.frame.size.width / 2
        self.backButton.clipsToBounds = true
        
        self.postButton.layer.cornerRadius = 10.0
        self.photo.layer.cornerRadius = 10.0
        self.library.layer.cornerRadius = 10.0
        label.center = CGPointMake(190, 340)
        label.textColor = UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Center
        label.text = "Choose or take a photo!"
        self.view.addSubview(label)

        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        vc2.delegate = self
        vc2.allowsEditing = true
        vc2.sourceType = UIImagePickerControllerSourceType.Camera
        
        
        self.tabBarController?.tabBar.hidden = true
        print("composed")
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func findImage(sender: AnyObject) {
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func takeImage(sender: AnyObject) {
        self.presentViewController(vc2, animated: true, completion: nil)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            //let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            
            vc.dismissViewControllerAnimated(true) { () -> Void in
                self.postImageView.image = editedImage
                self.label.hidden = true
                
            }
            
            vc2.dismissViewControllerAnimated(true) { () -> Void in
                self.postImageView.image = editedImage
                self.label.hidden = true
            }

            //self.postImageView.image = originalImage
    }
    
    
    @IBAction func onSend(sender: AnyObject) {
        
    }
    
    @IBAction func onLeave(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
