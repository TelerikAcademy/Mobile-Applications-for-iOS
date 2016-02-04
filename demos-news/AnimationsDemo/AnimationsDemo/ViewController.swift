//
//  ViewController.swift
//  AnimationsDemo
//
//  Created by Doncho Minkov on 2/2/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var _view: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let parentViewFrame = self.view.frame
        
        let frame = CGRectMake(parentViewFrame.midX - 75,
                    parentViewFrame.midY - 75,
                    150, 150);
        
        _view = AnimatedView(frame: frame);
        
        _view?.backgroundColor = UIColor.blackColor()
        
        self.view.addSubview(_view!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        _view?.touchesBegan(touches, withEvent: event)
    }
    
    
}

