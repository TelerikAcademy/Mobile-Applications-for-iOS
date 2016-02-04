//
//  DrawingCanvasViewController.swift
//  CoreGraphicsDemos
//
//  Created by Doncho Minkov on 2/2/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

import UIKit

class DrawingCanvasViewController: UIViewController {
    override func viewDidLoad() {
        let bounds = self.view.frame
        
        let canvas = DrawingCanvas(frame: bounds);
        
        self.view.addSubview(canvas)
    }
}
