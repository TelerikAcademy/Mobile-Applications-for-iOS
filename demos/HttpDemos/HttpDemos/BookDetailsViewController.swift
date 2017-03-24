//
//  BookDetailsViewController.swift
//  HttpDemos
//
//  Created by Doncho Minkov on 3/22/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

class BookDetailsViewController: UIViewController, HttpRequesterDelegate {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    var bookId: String?
    var book: Book?
    
    var url: String {
        get{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return "\(appDelegate.baseUrl)/books"
        }
    }
    
    var http: HttpRequester? {
        get{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return appDelegate.http
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadBookDetails()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadBookDetails(){
        self.http?.delegate = self
        let url = "\(self.url)/\(self.bookId!)"
        self.showLoadingScreen()
        self.http?.get(fromUrl: url)
    }
    
    func didReceiveData(data: Any) {
        let dict = data as! Dictionary<String, Any>
        self.book = Book(withDict: dict)
        self.updateUI()
    }
    
    func updateUI() {
        DispatchQueue.main.async {
            self.labelTitle.text = self.book?.title
            self.labelDescription.text = self.book?.bookDescription
            self.hideLoadingScreen()
        }
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
