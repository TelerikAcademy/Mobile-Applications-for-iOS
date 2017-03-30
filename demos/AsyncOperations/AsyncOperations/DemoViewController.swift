//
//  DemoViewController.swift
//  AsyncOperations
//
//  Created by Doncho Minkov on 3/20/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.

import UIKit

class DemoViewController: UIViewController {
    
    var url: URL {
        get {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return URL(string: appDelegate.baseUrl + "/books")!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        //        var booksData = BooksData()
        //
        //        // Delegate pattern
        //
        //        booksData.delegate = self
        //        booksData.getAll()
        //
        //
        //        // LAMBDA
        //
        //        booksData.getAll(completionCallback: {(books, error) in
        //
        //        })
        
        //        Get the URL
        let url = self.url
        
        //        create the NSMutableURLRequest
        
        let request = NSMutableURLRequest(url: url)
        
        request.httpMethod = "GET"
        
        //        send the request wiht URLSession
        
        
        let urlRequest = request as URLRequest
        
        let session =   URLSession.shared.dataTask(with:urlRequest) { (data, response, error) in
            do {
                let json = try  JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                print(json)
            } catch {
                
            }
        }
        
        session.resume()
        
        //        use the response
        
    }
    
    func onDataReceived(books: [Book]) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
