//
//  ViewController.swift
//  SQLiteExplore
//
//  Created by Doncho Minkov on 3/27/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController, UITableViewDataSource, SuperheroesDataDelegate {
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier = "superhero-cell"
    
    var data: BaseSuperheroesData?
    var superheroes: [Superhero] = []
    
    override func viewWillAppear(_ animated: Bool) {
        data?.getAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /* TableView Data Source */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.superheroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = self.superheroes[indexPath.row].name
        
        return cell
    }
    
    func didGetAll(superheroes: [Superhero]) {
        print("Superheroes received")
        self.superheroes = superheroes;
        weak var weakSelf = self
        DispatchQueue.main.async {
            weakSelf?.tableView.reloadData()
        }
    }
}

