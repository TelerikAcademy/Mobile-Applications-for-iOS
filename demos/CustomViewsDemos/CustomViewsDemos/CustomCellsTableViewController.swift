//
//  CustomCellsTableViewController.swift
//  CustomViewsDemos
//
//  Created by Doncho Minkov on 3/24/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

class CustomCellsTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "ImageAndTextTableViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "my-cell")
        self.tableView.rowHeight = 120
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "my-cell", for: indexPath) as! ImageAndTextTableViewCell
        
        cell.theLabel?.text = "Value \(indexPath.row)"
        
        let imageUrl = "https://static.comicvine.com/uploads/original/11111/111112793/3031477-nealadamsbatman.jpg"
        
        cell.theImage.imageUrl = imageUrl
        
        return cell
    }
}
