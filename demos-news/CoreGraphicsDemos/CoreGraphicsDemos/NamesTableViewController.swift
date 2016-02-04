//
//  NamesTableViewController.swift
//  CoreGraphicsDemos
//
//  Created by Doncho Minkov on 2/2/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

import UIKit

class NamesTableViewController: UITableViewController {
    
    var names: [String] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        names = ["Gosho", "Pesho", "Georga"]
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "NameCellIdenfitier";
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier);
        
        if(cell == nil || !(cell!.isKindOfClass(GradientCell))) {
            cell = GradientCell(style: .Default, reuseIdentifier: cellIdentifier);
        }
        
        cell!.textLabel!.text = names[indexPath.row]
        
        return cell!;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names.count;
    }

}
