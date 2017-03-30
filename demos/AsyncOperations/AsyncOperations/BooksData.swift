//
//  BooksData.swift
//  AsyncOperations
//
//  Created by Doncho Minkov on 3/20/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit


protocol BooksDataDelegate {
    func onDataReceived(books: [Book]) -> Void
    func onDetailsReceived(book: Book) -> Void
}

class BooksData {
    var delegate: BooksDataDelegate?
    
    
    convenience init() {
        self.init(withDelegate: nil)
    }
    
    init(withDelegate delegate: BooksDataDelegate?){
        self.delegate = delegate
    }
    
    var books: [Book] = [Book(withTitle: "Harry Potter and the Sorc. Stone", andDescription: "Book 1"),
                          Book(withTitle: "Harry Potter and the Chamber of Secrets", andDescription: "Book 2")]
    
    func getAllWithCompletionCallback(_ callback: @escaping (_ books: [Book]?) -> Void){
        let timeout = DispatchTime.now() + .seconds(3)
        
        weak var weakSelf = self
        
        DispatchQueue.main.asyncAfter(deadline: timeout) {
            callback((weakSelf?.books)!)
        }
    }
    
    func getAll() {
        weak var weakSelf = self
        self.getAllWithCompletionCallback { (books) in
            weakSelf?.delegate?.onDataReceived(books: books!);
        }
    }
    
    func getById(_ id: String) {
        let timeout = DispatchTime.now() + .seconds(3)
        
        weak var weakSelf = self
        
        let book = self.books.filter { $0.id == id }.first
        
        DispatchQueue.main.asyncAfter(deadline: timeout) {
            weakSelf?.delegate?.onDetailsReceived(book: book!)
        }
    }
}
