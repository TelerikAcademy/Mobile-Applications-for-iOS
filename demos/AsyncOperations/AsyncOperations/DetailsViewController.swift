//
//  ViewController.swift
//  AsyncOperations
//
//  Created by Doncho Minkov on 3/20/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.

import UIKit

class DetailsViewController: UIViewController, BooksDataDelegate {
    var bookId: String?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var booksData: BooksData? {
        get{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return appDelegate.booksData
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.booksData?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.booksData?.getById(self.bookId!)

        self.showLoading()
        
//        self.loading = UIActivityIndicatorView(frame: self.view.frame)
//        self.loading?.activityIndicatorViewStyle = .whiteLarge
//        self.loading?.backgroundColor = .black
//        
//        self.view.addSubview(self.loading!)
//        
//        self.loading?.startAnimating()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func onDetailsReceived(book: Book) {
        self.titleLabel.text = book.title
        self.descriptionLabel.text = book.bookDescription
        self.hideLoading()
//        self.loading?.stopAnimating()
//        self.loading?.removeFromSuperview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

