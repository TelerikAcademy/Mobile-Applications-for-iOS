//
//  BadgeViewController.swift
//  TabsNavigationController
//
//  Created by Doncho Minkov on 3/20/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

class BadgeViewController: UIViewController {
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.tabBarItem)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func increaseBadgeCount(_ sender: UIButton) {
//        self.count += 1
        print(self.count += 1)
        self.tabBarItem.badgeValue = "\(self.count)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
