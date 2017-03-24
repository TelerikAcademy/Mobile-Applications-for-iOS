//
//  BookMappings.swift
//  DependencyInjectionDemos
//
//  Created by Doncho Minkov on 3/24/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import Foundation

extension Book {
    convenience init(withDict dict: Dictionary<String, Any>) {
        let title = dict["title"] as! String
        let description =
                (dict["description"] ?? "") as! String
        self.init(withTitle:  title, andDescription: description)
    }
    
    func toDict() -> Dictionary<String, Any> {
        return [
            "title": self.title!,
            "description": self.bookDescription ?? ""
        ]
    }
}
