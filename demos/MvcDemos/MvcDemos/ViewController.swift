//
//  ViewController.swift
//  MvcDemos
//
//  Created by Doncho Minkov on 3/24/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.

import UIKit

class MvcView:UIView{
    var delegate: BaseMvcController?
    
    func click() {
//        self.delegate.clickFired()
    }
}

class MvcController {
    var view: MvcController?
}

class ViewController: UIViewController {
    var mvcController: MvcController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.mvcView = MvcView(frame: self.view.frame)
        self.mvcController = MvcController(withView: self.view)
        self.view.addSubview(self.view!)
        //if on wide screen
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
}

