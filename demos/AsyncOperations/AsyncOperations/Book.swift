//
//  Book.swift
//  AsyncOperations
//
//  Created by Doncho Minkov on 3/20/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.

import Foundation

class Book {
    var id: String
    var title: String
    var bookDescription: String
    
    convenience init(withTitle title: String, andDescription description: String){
        let id = "Id-\(arc4random())"
        self.init(withId: id, title: title, andDescription: description)
    }
    
    init(withId id: String, title: String, andDescription description: String){
        self.id = id
        self.title = title
        self.bookDescription = description
    }
}
