//
//  ViewController.swift
//  HttpDemos
//
//  Created by Doncho Minkov on 3/22/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HttpRequesterDelegate {
    var http: HttpRequester?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.http = HttpRequester()
        self.http?.delegate = self
        self.http?.get(fromUrl: "http://192.168.199.112:3001/api/books")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didReceiveData(data: Any) {
        let arr = data as! [Any]
        arr.forEach { (item) in
            let dict = item as! Dictionary<String, Any>
            print(dict["title"])
        }
    }
    
    func didReceiveError(error: Error) {
        
    }
}

