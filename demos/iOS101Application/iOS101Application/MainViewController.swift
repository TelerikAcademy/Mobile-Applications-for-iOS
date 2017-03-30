//
//  ViewController.swift
//  iOS101Application
//
//  Created by Doncho Minkov on 3/13/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit
import Swifter

class MainViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBAction func click(_ sender: Any) {
        let text = "Date: \(Date())";
        
        self.label.text = text;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let server = HttpServer()
        server["/hello"] = { .OK(.Html("You asked for " + $0.url)) }
        server.start()
        
        
        label.text = "I am Loaded!";
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

