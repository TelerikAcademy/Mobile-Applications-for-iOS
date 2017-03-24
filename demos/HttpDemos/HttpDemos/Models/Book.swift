//
//  Book.swift
//  HttpDemos
//
//  Created by Doncho Minkov on 3/22/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

class Book {
    var id: String?
    var title: String?
    var bookDescription: String?
    
    convenience init(withTitle title: String, andDescription bookDescription: String?){
        self.init(withId: "", title: title, andDescription: bookDescription)
    }
    
    init(withId id: String, title: String, andDescription bookDescription: String?){
        self.id = id
        self.title = title
        self.bookDescription = bookDescription
    }
}
