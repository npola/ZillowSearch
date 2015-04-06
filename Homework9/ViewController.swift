//
//  ViewController.swift
//  Homework9
//
//  Created by Arjun Pola on 15/11/14.
//  Copyright (c) 2014 Arjun Pola. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate,UITextFieldDelegate {
    
     @IBOutlet var addressWarn: UILabel?
     @IBOutlet var cityWarn: UILabel?
     @IBOutlet var stateWarn: UILabel?
     @IBOutlet var zillowLogo: UIImageView?
     @IBOutlet var street: UITextField?
     @IBOutlet var city: UITextField?
     @IBOutlet var state: UITextField?
     @IBOutlet var myPicker: UIPickerView?
     @IBOutlet var noResult: UILabel?
    
    let pickerData = ["AL","AK","AZ","AR","CA","CO","CT","DE","DC","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY"]
    
    override func viewWillAppear(animated: Bool) {
      super.viewWillAppear(false)
        
        addressWarn?.hidden = true
        cityWarn?.hidden = true
        stateWarn?.hidden = true
        myPicker?.hidden = true
        noResult?.hidden = true
        
        zillowLogo?.layer.cornerRadius = 8
        zillowLogo?.layer.masksToBounds = true
        
        navigationController?.navigationBar.hidden = true;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        myPicker?.dataSource = self;
        myPicker?.delegate = self;
        
        state!.layer.borderWidth = 0.0;
        state!.layer.borderColor = UIColor(red:211/255 ,green:84/255 ,blue:0/255 , alpha:1).CGColor;
        state!.layer.cornerRadius = 5;
        state!.clipsToBounds = true;
        
        city!.layer.borderWidth = 0.0;
        city!.layer.borderColor = UIColor(red:211/255 ,green:84/255 ,blue:0/255 , alpha:1).CGColor;
        city!.layer.cornerRadius = 5;
        city!.clipsToBounds = true;
        
        street!.layer.borderWidth = 0.0;
        street!.layer.borderColor = UIColor(red:211/255 ,green:84/255 ,blue:0/255 , alpha:1).CGColor;
        street!.layer.cornerRadius = 5;
        street!.clipsToBounds = true;
        
        state?.delegate = self;
        city?.delegate = self;
        street?.delegate = self;
        
        state?.returnKeyType = UIReturnKeyType.Done;
        city?.returnKeyType = UIReturnKeyType.Done;
        street?.returnKeyType = UIReturnKeyType.Done;
        
        var line: UIView = UIView(frame: CGRect(x: 10, y: 400, width: 350, height: 1.5))
        line.backgroundColor = UIColor(red:5 , green:5, blue:5, alpha: 0.6)
        
        self.view.addSubview(line)

        
    }
    
    
    //Actions
    
    @IBAction func submit(sender: UIButton)
    {
        
        var search: Bool?
        search = true;
        
        if((street?.hasText()) != true)
        {
            addressWarn?.hidden = false;
            search = false;
        }
        else{
            addressWarn?.hidden = true;
        }
 
        
        if((city?.hasText()) != true)
        {
            cityWarn?.hidden = false;
            search = false;
        }
        else{
            cityWarn?.hidden = true;
        }
        
        if((state?.hasText()) != true)
        {
            stateWarn?.hidden = false;
            search = false;
        }
        else
        {
            stateWarn?.hidden = true;
        }
        
        
        if(search ==  true)
        {
            
            var streetInput : String = street!.text
            var cityInput : String = city!.text
            var stateInput : String = state!.text
            
            var request = HTTPTask()
            request.responseSerializer = JSONResponseSerializer()

            request.GET("http://zillowswiftapi-env.elasticbeanstalk.com/", parameters:["cityInput":cityInput,"stateInput":stateInput,"streetInput":streetInput], success: {(response: HTTPResponse) in
                if let dict = response.responseObject as? Dictionary<String,AnyObject> {
                    var success: Int = dict["success"] as Int;
                    var url: String  = "";
////                    println("Success: \(success)") //prints the HTML of the page
                    if(success == 1)
                    {
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            self.searchResultSegue(dict);
                        })
                        
                    }
                    else
                    {
                        dispatch_async(dispatch_get_main_queue(), {
                            self.noSearchResult();
                        })
                    }
                }
                },failure: {(error: NSError, response: HTTPResponse?) in
                    println("error: \(error)")
            })
        }

        
    }
    
    
    //Other Functions
    
    func noSearchResult()
    {
        noResult?.hidden = false;
    }
    
    func searchResultSegue(jsonData: Dictionary<String,AnyObject>)
    {
        self.performSegueWithIdentifier("tabViewController", sender: jsonData);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        state?.text =  pickerData[row]

    }
    
    func textFieldDidBeginEditing(textField: UITextField!) {
        
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {

        if(textField.restorationIdentifier == state?.restorationIdentifier)
        {
            myPicker?.hidden = false;
            self.view.endEditing(true);
        
            textField.layer.borderWidth = 2.0;
            
            return false;
        }
        else{
            myPicker?.hidden = true;
            state!.layer.borderWidth = 0;
        }
        
        textField.layer.borderWidth = 2.0;
        
            return true;
    }
    
    func textFieldShouldEndEditing(textField: UITextField!) -> Bool {  //delegate method
        
        textField.layer.borderWidth = 0.0;
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true)
        return true;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "tabViewController"{
            
            let firstView = segue.destinationViewController.childViewControllers[0] as BasicInfo
            
            let secondView = segue.destinationViewController.childViewControllers[1] as HistoricalZestimates
            
            firstView.jsonData = sender as Dictionary<String,AnyObject>;
            firstView.key = firstView.jsonData["key"] as Dictionary<String,String>
            firstView.value = firstView.jsonData["value"] as Dictionary<String,String>
            
            firstView.address = firstView.jsonData["address"] as Dictionary<String,String>;
            
            secondView.Jaddress = firstView.address;
            secondView.chartURL = firstView.jsonData["chart"] as String;
    }

}

}
