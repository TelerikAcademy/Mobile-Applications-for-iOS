//
//  ViewController.swift
//  HttpDemos
//
//  Created by Doncho Minkov on 3/22/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import Foundation

extension Book {
    convenience init(withDict dict: Dictionary<String, Any>){
        let id = dict["id"] as! String
        let title = dict["title"] as! String
        let bookDescription = dict["description"] as? String
        self.init(withId :id, title: title, andDescription: bookDescription)
    }
    
    static func fromDict(_ dict: Dictionary<String, Any>) -> Book {
        return Book(withDict: dict)
    }
    
    func toDict() -> Dictionary<String, Any> {
        return [
            "title": self.title!,
            "description": self.bookDescription!
        ]
    }
}
