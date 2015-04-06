//
//  TabViewController.swift
//  Homework9
//
//  Created by Arjun Pola on 17/11/14.
//  Copyright (c) 2014 Arjun Pola. All rights reserved.
//

import UIKit

class BasicInfo: UIViewController, UITableViewDelegate, UITableViewDataSource,UIAlertViewDelegate {
    
    var jsonData = Dictionary<String,AnyObject>();
    @IBOutlet var zestimate: UILabel?
    @IBOutlet var terms : UILabel?

    var key = Dictionary<String,String>();
    var value = Dictionary<String,String>();
    var address = Dictionary<String,String>();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        navigationController?.navigationBar.hidden = false;
        let children = self.childViewControllers as [UIViewController];
        let child = children[0] as UITableViewController;
        
        child.tableView.registerNib(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "DataCell")
        
        child.tableView.registerNib(UINib(nibName: "Cell2", bundle: nil), forCellReuseIdentifier: "DataImgCell")
        
        child.tableView.registerNib(UINib(nibName: "Cell3", bundle: nil), forCellReuseIdentifier: "HyperlinkCell")
        
        child.tableView.delegate = self;
        child.tableView.dataSource = self;
        
        zestimate?.textColor = UIColor(red: 107/255, green: 195/255, blue: 234/255, alpha: 1)
        terms?.textColor = UIColor(red: 107/255, green: 195/255, blue: 234/255, alpha: 1)
        var line1: UIView = UIView(frame: CGRect(x: 210, y: 610, width: 90, height: 1))
        line1.backgroundColor = UIColor(red:107/255 , green:195/255, blue:234/255, alpha:1)
        self.view.addSubview(line1)
        var line2: UIView = UIView(frame: CGRect(x: 120, y: 630, width: 140, height: 1))
        line2.backgroundColor = UIColor(red:107/255 , green:195/255, blue:234/255, alpha: 1)
        self.view.addSubview(line2)
        
        var tapGesture = UITapGestureRecognizer(target: self, action: "openTermsUrl")
        terms?.addGestureRecognizer(tapGesture)
        
        tapGesture = UITapGestureRecognizer(target: self, action: "openZestimateUrl")
        zestimate?.addGestureRecognizer(tapGesture)
        
//        let vcTypeName = NSStringFromClass(child.classForCoder)
//        println("\(vcTypeName)")
        
    }
    
    
    func openTermsUrl() {
        
        let targetURL = NSURL(string:"http://www.zillow.com/howto/api/APITerms.htm")
        let application=UIApplication.sharedApplication()
        application.openURL(targetURL!);
        
    }
    
    func openZestimateUrl() {
        
        let targetURL = NSURL(string:"http://www.zillow.com/wikipages/what-is-a-zestimate/")
        let application=UIApplication.sharedApplication()
        application.openURL(targetURL!);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    @IBAction func facebookShare(sender: UIButton) {

        
        var createAccountErrorAlert: UIAlertView = UIAlertView()
        
        createAccountErrorAlert.delegate = self
        
        createAccountErrorAlert.title = "Post to Facebook"
        createAccountErrorAlert.addButtonWithTitle("Cancel")
        createAccountErrorAlert.addButtonWithTitle("Post Property Details")
        
        createAccountErrorAlert.show()
        

        
        //            var share: FacebookShare = FacebookShare();
        //            share.name = address["add"];
        //            share.link = address["link"];
        //            share.caption = "Property information from Zillow.com";
        //            share.desc = "Last Sold Price: "+value["9"]!+", 30 Days Overall Change: "+value["12"]!;
        //            share.pictureLink = jsonData["chart"] as String;
        //            share.view = self.view;
        //            share.shareOnFacebook()
    }
    
    
    // UITableViewDataSource methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 17
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0)
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("HyperlinkCell", forIndexPath: indexPath) as MyCustomCell3
            
            cell.address.text = address["add"];
            cell.address.textColor = UIColor(red: 107/255, green: 195/255, blue: 234/255, alpha: 1)
            
//            var line: UIView = UIView(frame: CGRect(x: 0, y: 60, width: 90, height: 1))
//            line.backgroundColor = UIColor(red:107/255 , green:195/255, blue:234/255, alpha:1)
            
//            cell.addSubView(line);
            
            
            return cell
        }
        else if(indexPath.row != 12 && indexPath.row != 15)
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("DataCell", forIndexPath: indexPath) as MyCustomCell
            
            cell.key.text = key[String(indexPath.row)];
            cell.value.text = value[String(indexPath.row)];
            
            cell.value.textAlignment = NSTextAlignment.Right
            cell.key.textAlignment = NSTextAlignment.Left
            
            if(indexPath.row % 2 != 0)
            {
                cell.backgroundColor = UIColor(red:245/255 ,green:244/255 ,blue:1 , alpha:1)
            }
            else
            {
                cell.backgroundColor = UIColor(red:1 ,green:1 ,blue:1 , alpha:1)
            }
            
            cell.value.textAlignment = NSTextAlignment.Right
            
           return cell
            
        }else{
            
            let cell = tableView.dequeueReusableCellWithIdentifier("DataImgCell", forIndexPath: indexPath) as MyCustomCell2
            
            cell.key.text = key[String(indexPath.row)];
            cell.value.text = value[String(indexPath.row)];
            
            if(indexPath.row % 2 != 0)
            {
                cell.backgroundColor = UIColor(red:245/255 ,green:244/255 ,blue:1 , alpha:1)
            }
            else
            {
                cell.backgroundColor = UIColor(red:1 ,green:1 ,blue:1 , alpha:1)
            }
            
            cell.value.textAlignment = NSTextAlignment.Right
            cell.key.textAlignment = NSTextAlignment.Left
            
            var img = String(indexPath.row)+"image";
            var arrow = jsonData[img] as String;
            cell.arrow.image = UIImage(named:arrow)
            return cell
        }
    }
    
    // UITableViewDelegate methods
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        if(indexPath.row == 0)
        {
            let targetURL = NSURL(string:address["link"]!)
            let application=UIApplication.sharedApplication()
            application.openURL(targetURL!);
            
        }
        
    }
    
    // MARK: UIAlertViewDelegate
    
    func alertView(View: UIAlertView!, clickedButtonAtIndex buttonIndex: Int){
        
        var share: FacebookShare = FacebookShare();
        share.view = self.view;
        
        switch buttonIndex{
            
        case 1:
                        share.name = address["add"];
                        share.link = address["link"];
                        share.caption = "Property information from Zillow.com";
                        share.desc = "Last Sold Price: "+value["9"]!+", 30 Days Overall Change: "+value["12"]!;
                        share.pictureLink = jsonData["chart"] as String;
                        share.shareOnFacebook()
            break;
        case 0:
            share.displayToast("Post Cancelled");
//            JLToast.makeText("Post Cancelled", duration: JLToastDelay.LongDelay).show();
            break;
        default:
            NSLog("Default");
            break;
            
        }
    }
    
}
