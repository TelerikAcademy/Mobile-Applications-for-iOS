//
//  CustomTableViewController.swift
//  StoryboardsAndViewControllers
//
//  Created by Doncho Minkov on 3/17/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

class CustomTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = UITableView(frame: self.view.bounds, style: .plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
