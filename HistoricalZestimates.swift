//
//  HistoricalZestimates.swift
//  Homework9
//
//  Created by Arjun Pola on 19/11/14.
//  Copyright (c) 2014 Arjun Pola. All rights reserved.
//

import UIKit

class HistoricalZestimates: UIViewController {
    
    @IBOutlet var header: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var terms: UILabel!
    @IBOutlet var zestimate: UILabel!
    @IBOutlet var chart: UIImageView!
    
    var chartURL = String();
    var Jaddress = Dictionary<String,String>()
    
    var headers: [String] = ["Historical zestimate for the past 1 year","Historical zestimate for the past 5 years","Historical zestimate for the past 10 years"];
    
    var urls = NSMutableArray()
    var imageCache = NSMutableDictionary()
    var imageNo :Int = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tapGesture = UITapGestureRecognizer(target: self, action: "openTermsUrl")
        terms?.addGestureRecognizer(tapGesture)
        
        tapGesture = UITapGestureRecognizer(target: self, action: "openZestimateUrl")
        zestimate?.addGestureRecognizer(tapGesture)
        
        urls.addObject(chartURL);
        var newURL = chartURL.stringByReplacingOccurrencesOfString("1year", withString: "5years", options: NSStringCompareOptions.LiteralSearch, range: nil)
        urls.addObject(newURL);
        newURL = chartURL.stringByReplacingOccurrencesOfString("1year", withString: "10years", options: NSStringCompareOptions.LiteralSearch, range: nil);
        urls.addObject(newURL);
        
       // print("URLS ARE: \n \(urls)");
        
        address.text = Jaddress["add"];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),{
            
               var image =  UIImage(data: NSData(contentsOfURL: NSURL(string:self.chartURL)!)!)
                self.imageCache.setObject(image!,forKey: self.chartURL);
            
                dispatch_async(dispatch_get_main_queue(),{
                    self.chart.image = image;
                })
            
            var url: String = self.urls[1] as String
            image = UIImage(data:NSData(contentsOfURL: NSURL(string:url)!)!)
            self.imageCache.setObject(image!,forKey:url)
            
            url = self.urls[2] as String
            image = UIImage(data:NSData(contentsOfURL: NSURL(string:url)!)!)
            self.imageCache.setObject(image!,forKey:url)
        })
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    @IBAction func previous(sender: UIButton)
    {
        if(imageNo != 0)
        {
            var url: String = urls[--imageNo] as String
            chart.image = imageCache[url] as? UIImage
            header.text = headers[imageNo]
        }
        
    }
    
    @IBAction func next(sender: UIButton)
    {
        if(imageNo != 2)
        {
            var url: String = urls[++imageNo] as String
            chart.image = imageCache[url] as? UIImage
            header.text = headers[imageNo]
        }
        
    }


    
}
