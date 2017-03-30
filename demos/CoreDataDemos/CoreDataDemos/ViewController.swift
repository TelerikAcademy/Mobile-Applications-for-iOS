//
//  ViewController.swift
//  CoreDataDemos
//
//  Created by Doncho Minkov on 3/27/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {
    var superheroes: [Superhero] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.loadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superheroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let superhero = self.superheroes[indexPath.row]
        cell?.textLabel?.text = "\(superhero.id!), \(superhero.name!), \(superhero.secretIdentity!)"
        return cell!
    }
    @IBAction func save() {
        let id = "\(arc4random())"
        let name = "Batman-\(arc4random())"
        let secretIdentity = "Bruce Wayne"
        
        let entity = NSEntityDescription.entity(forEntityName: "Superhero", in: self.managedObjectContext)
        
        let superhero: Superhero =
            Superhero(entity: entity!, insertInto: self.managedObjectContext)
        
        //KVC
//        superhero.setValue(id, forKey: "id")
//        superhero.setValue(name, forKey: "name")
//        superhero.setValue(secretIdentity, forKey: "secretIdentity")

        superhero.id = id
        superhero.name = name
        superhero.secretIdentity = secretIdentity
        
        let power:Power = Power(entity: NSEntityDescription.entity(forEntityName: "Power", in: self.managedObjectContext)!, insertInto: self.managedObjectContext)
        
        power.name = "Utility bejlt"
        
        superhero.addToPowers(power)
        
        self.managedObjectContext.insert(superhero)
        
        self.appDelegate.saveContext()
    }
    
    var appDelegate: AppDelegate {
        get {
            return UIApplication.shared.delegate as! AppDelegate
        }
    }
    
    var managedObjectContext: NSManagedObjectContext {
        get {
            return self.appDelegate.persistentContainer.viewContext
        }
    }
    
    func loadData() {
        do {
            self.superheroes = try self.managedObjectContext.fetch(Superhero.fetchRequest())
            
            let powers = superheroes.last?.powers;
            print(powers)
            let v = 5
            
        } catch let error as NSError {
            print("The error is \(error.userInfo)")
        }
        
    }
}

