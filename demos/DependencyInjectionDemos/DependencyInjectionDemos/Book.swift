//
//  Book.swift
//  DependencyInjectionDemos
//
//  Created by Doncho Minkov on 3/24/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import Foundation

class Book {
    var title: String?
    var bookDescription: String?
    init(withTitle title: String, andDescription bookDescription: String){
        self.title = title
        self.bookDescription = bookDescription
    }
}
