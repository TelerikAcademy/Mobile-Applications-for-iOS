//
//  AddBookModalViewController.swift
//  HttpDemos
//
//  Created by Doncho Minkov on 3/22/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.

import UIKit

protocol AddBookModalDelegate {
    func didCreateBook(book: Book?)
}

class AddBookModalViewController: UIViewController, HttpRequesterDelegate {
    @IBOutlet weak var textTitle: UITextField!
    @IBOutlet weak var textDescription: UITextView!
    
    var delegate: AddBookModalDelegate?
    
    var url: String {
        get {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return "\(appDelegate.baseUrl)/books"
        }
    }
    
    var http: HttpRequester? {
        get {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return appDelegate.http
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.http?.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save() {
        let title = self.textTitle.text
        let description = self.textDescription.text
        
        let book = Book(withTitle: title!, andDescription: description!)
        let bookDict = book.toDict()
        
        self.http?.postJson(toUrl: self.url, withBody: bookDict)
    }
    
    @IBAction func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func didReceiveData(data: Any) {
        let dict = data as! Dictionary<String, Any>
        let book = Book(withDict: dict)
        self.delegate?.didCreateBook(book: book)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func didReceiveError(error: HttpError) {
        print(error)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
