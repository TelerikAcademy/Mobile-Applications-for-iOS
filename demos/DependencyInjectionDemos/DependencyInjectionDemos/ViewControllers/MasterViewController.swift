//
//  MasterViewController.swift
//  DependencyInjectionDemos
//
//  Created by Doncho Minkov on 3/24/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, BooksDataDelegate {
    var data: BooksData?
    var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "book-cell")
        self.data?.getAll()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func didReceiveAll(books: [Book]) {
        self.books = books
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "book-cell", for: indexPath)
        
        cell.textLabel?.text = self.books[indexPath.row].title
        
        return cell
    }
}
