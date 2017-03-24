//
//  BooksData.swift
//  DependencyInjectionDemos
//
//  Created by Doncho Minkov on 3/24/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import Foundation

class BooksData: HttpRequesterDelegate {
    var url: String?
    var httpRequester: HttpRequesterBase?
    var delegate: BooksDataDelegate?
    
    func getAll() {
        self.httpRequester?.get(fromUrl: self.url!, withHeaders: nil)
    }
    
    func create(book: Book) {
        
    }
    
    func didCompleteGet(result: Any) {
        let books = (result as! [Dictionary<String, Any>])
            .map() {Book(withDict: $0)}
        
        self.delegate?.didReceiveAll(books: books)
    }
}
