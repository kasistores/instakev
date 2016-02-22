//
//  AccountViewController.swift
//  
//
//  Created by Kevin Asistores on 2/17/16.
//
//

import UIKit
import Parse


class AccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
     var refreshControl: UIRefreshControl!
    
    var posts : [PFObject]!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        print("homed!")
        self.tabBarController!.tabBar.tintColor = UIColor.whiteColor()
        self.tabBarController?.tabBar.backgroundColor = UIColor.blackColor()
        tableView.delegate = self
        tableView.dataSource = self
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "onRefresh", forControlEvents: UIControlEvents.ValueChanged)
        tableView.insertSubview(refreshControl, atIndex: 0)
        // Do any additional setup after loading the view.
        
        //let predicate = NSPredicate(format: "likesCount > 100")
        
        let query = PFQuery(className: "UserMedia")
        //query = PFQuery(className: "UserMedia", predicate: predicate)
        //query.whereKey("likesCount", lessThan: 100)
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        let media = PFObject(className: "UserMedia")
        media["author"] = PFUser.currentUser()

        
        query.findObjectsInBackgroundWithBlock { (media: [PFObject]?, error: NSError?) -> Void in
            
            //self.tableView.reloadData()
            if let media = media {
                
                self.posts = media
                self.tableView.reloadData()
                //print(self.feed!)
                // do something with the data fetched
            } else {
                // handle error
            }
            
        }
        
    }
    
    func delay(delay:Double, closure:()->()) {
        self.tableView.reloadData()
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
        self.tableView.reloadData()
    }
    
    func onRefresh() {
        self.tableView.reloadData()
        delay(2, closure: {
            self.refreshControl.endRefreshing()
            self.tableView.reloadData()
        })
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        //self.tableView.reloadData()
        if let posts = posts {
             print(posts.count)
            return posts.count
        }
        else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
         let cell = tableView.dequeueReusableCellWithIdentifier("PostCell", forIndexPath: indexPath) as! PostCell
        
        let post = self.posts![indexPath.row]
        //let numLikes = post["likesCount"]
        
        cell.userNameLabel.text = post["author"].username
        cell.captionLabel.text = post["caption"] as? String
        //cell.numLikes.text = numLikes as? String
        
        let pictureFile = post["media"] as! PFFile
        
        pictureFile.getDataInBackgroundWithBlock {
            (imageData: NSData?, error: NSError?) -> Void in
            if error == nil {
                if let imageData = imageData {
                    let image = UIImage(data:imageData)
                    cell.postImage.image = image
                }
            }
            
        }
        
        return cell
        
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
