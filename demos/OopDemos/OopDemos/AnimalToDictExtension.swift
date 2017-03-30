//
//  AnimalExtension.swift
//  OopDemos
//
//  Created by Doncho Minkov on 3/15/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import Foundation

extension Animal {
    convenience init(withDict dict: Dictionary<String, Any>) {
        let name:String = "\(dict["name"])"
        let age: Int = dict["age"] as! Int
        self.init(withName: name,
                  andAge: age)
    }
    
    static func fromDict(dict: Dictionary<String, Any>) -> Animal {
        return Animal(withDict: dict)
    }
    
    func toDict() -> Dictionary<String, Any> {
        let dict:Dictionary<String, Any> = [
            "name": self.name,
            "age": self.age
        ]
        return dict
    }
}
