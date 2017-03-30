//
//  ViewController.swift
//  CustomViewsDemos
//
//  Created by Doncho Minkov on 3/24/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var rect: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rect = UIView(frame: CGRect(x: 10, y: 10, width: 150, height: 150))
        self.rect?.backgroundColor = .black
        self.rect?.layer.cornerRadius = 5
        self.rect?.layer.borderColor = UIColor.yellow.cgColor
        self.rect?.layer.borderWidth = 5
        self.view.addSubview(self.rect!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

