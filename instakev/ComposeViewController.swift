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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRectMake(0, 0, 200, 41))
        label.center = CGPointMake(190, 284)
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
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            //let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            
            vc.dismissViewControllerAnimated(true) { () -> Void in
            }
            self.postImageView.image = originalImage
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
