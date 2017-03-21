//
//  AddSuperheroViewController.swift
//  CoreDataDemos
//
//  Created by Doncho Minkov on 2/3/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

import UIKit
import CoreData

class AddSuperheroViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var cityField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Add superhero"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveSuperhero(sender: AnyObject) {
        let name = self.nameField!.text;
        let cityName = self.cityField!.text;
        
        let superheroEntity = NSEntityDescription.entityForName("Superhero", inManagedObjectContext: self.managedContext)
        
        let superhero = NSManagedObject(entity: superheroEntity!, insertIntoManagedObjectContext: self.managedContext)
        
        superhero.setValue(name, forKey: "name")
        
        do {
            let city = try self.loadOrCreate(cityName!);
            superhero.setValue(city, forKey: "city")
            
            try self.managedContext.save()
            self.navigationController?.popViewControllerAnimated(true);
        }
        catch let error as NSError  {
            print("Error: \(error)")
        }
    }
    
    func loadOrCreate(cityName: String) throws -> NSManagedObject{
        
        //check if city exists
        let fetchRequest = NSFetchRequest(entityName: "City");
        
        let cities = try self.managedContext.executeFetchRequest(fetchRequest)
            as! [NSManagedObject];
        var city: NSManagedObject;
        
        for i in (0..<cities.count) {
            if(cities[i].valueForKey("name") as! String == cityName) {
                return cities[i];
            }
        }
        
        //if non-existant, then create new
        let cityEntity = NSEntityDescription.entityForName("City", inManagedObjectContext: self.managedContext)
        
        city = NSManagedObject(entity: cityEntity!, insertIntoManagedObjectContext: self.managedContext)
        
        city.setValue(cityName, forKey: "name")
        return city;
    }
    
    lazy var managedContext: NSManagedObjectContext = {
        let managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        return managedContext;
    }()
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
