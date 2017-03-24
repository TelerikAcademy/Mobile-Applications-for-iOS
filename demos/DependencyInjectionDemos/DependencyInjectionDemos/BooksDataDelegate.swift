//
//  BooksDataDelegate.swift
//  DependencyInjectionDemos
//
//  Created by Doncho Minkov on 3/24/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import Foundation

protocol BooksDataDelegate {
    func didReceiveAll(books: [Book])
}

extension BooksDataDelegate {
    func didReceiveAll(books: [Book]) {
        
    }
}
