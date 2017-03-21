//
//  SuperheroesTableTableViewController.swift
//  CoreDataDemos
//
//  Created by Doncho Minkov on 2/3/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

import UIKit
import CoreData

class SuperheroesTableTableViewController: UITableViewController {
    
    var cities = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "SuperheroCell")
        
        let btnGoToAddVC = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "goToAddVC")
        
        self.navigationItem.rightBarButtonItem = btnGoToAddVC
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let fetchRequest = NSFetchRequest(entityName: "City")
        
        do {
            let results = try self.managedContext.executeFetchRequest(fetchRequest)
            self.cities = results as! [NSManagedObject]
            self.tableView.reloadData()
        }
        catch let err as NSError {
            print("Error: \(err)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.cities.count;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //number of superheroes in city
        let city = self.cities[section];
        
        return city.mutableSetValueForKey("superheroes").count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SuperheroCell")
        
        let city = self.cities[indexPath.section];
        let superhero = city.mutableSetValueForKey("superheroes").allObjects[indexPath.row]
        
        let name = superhero.valueForKey("name") as! String;
        cell?.textLabel!.text = "\(name)"
        
        return cell!;
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let cityName = self.cities[section].valueForKey("name") as! String
        return "\(cityName) is guarded by: ";
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == .Delete) {
            let city = self.cities[indexPath.section]
            let superheroesInCity = city.mutableSetValueForKey("superheroes");
            let superhero = superheroesInCity.allObjects[indexPath.row]
            superheroesInCity.removeObject(superhero)
            
            if(superheroesInCity.count == 0){
                self.managedContext.deleteObject(city);
                self.cities.removeAtIndex(indexPath.section)
            }
            else {
                
                city.setValue(superheroesInCity, forKey: "superheroes")
            }
            do {
                try self.managedContext.save()
            }
            catch let err as NSError {
                print("Error: \(err)")
            }
            self.tableView.reloadData()
        }
    }
    
    func goToAddVC() {
        
        let addVC = self.storyboard?.instantiateViewControllerWithIdentifier("AddSuperheroScene")
        self.navigationController?.pushViewController(addVC!, animated: true)
    }
    
    lazy var managedContext: NSManagedObjectContext = {
        let managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        return managedContext;
    }()
    
}
