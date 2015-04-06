//
//  TabController.swift
//  Homework9
//
//  Created by Arjun Pola on 17/11/14.
//  Copyright (c) 2014 Arjun Pola. All rights reserved.
//

import UIKit

class TabController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        let vcs = self.viewControllers as [UIViewController]

        if let vc1 = vcs[0] as? BasicInfo{
            vc1.tabBarItem.title = "Basic Info";
        }
        
        if let vc2 = vcs[1] as? HistoricalZestimates{
            vc2.tabBarItem.title = "Historical Zestimates";
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(false)
    }
    
    override func viewDidLayoutSubviews() {
        self.tabBar.frame = CGRectMake(0, 60, UIScreen.mainScreen().bounds.size.width, 40)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
