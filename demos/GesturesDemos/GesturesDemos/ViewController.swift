//
//  ViewController.swift
//  GesturesDemos
//
//  Created by Doncho Minkov on 3/29/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var rect: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rect = UIView(frame: CGRect(x: self.view.frame.width / 2,
                                         y: self.view.frame.height / 2,
                                         width: 50, height: 50))
        self.rect?.backgroundColor = .blue
        self.view.addSubview(self.rect!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func move(_ panGesture: UIPanGestureRecognizer) {
        let location = panGesture.location(in: self.view)
        if !self.isInRect(location) {
            return
        }
        
        self.rect?.frame.origin = CGPoint(x: location.x - 25,
                                          y: location.y - 25)
    }
    
    var scale: CGFloat = 1.0
    
    var isTouch = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isTouch = true
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isTouch = false
    }
    
    @IBAction func scale(_ pinchGesture: UIPinchGestureRecognizer) {
        var newScale = pinchGesture.scale
            
        if !self.isTouch {
            newScale = newScale * self.scale
            self.scale = newScale
            self.isTouch = true
        }
        
        self.rect?.transform =  CGAffineTransform(scaleX: newScale, y: newScale)
    }
    
    
    @IBAction func rotate(_ rotateGesture: UIRotationGestureRecognizer) {
        let angle = rotateGesture.rotation
        
        self.rect?.transform = CGAffineTransform(rotationAngle: angle)
    }
    
    func isInRect(_ position: CGPoint) -> Bool {
        return (self.rect?.frame.minX)! <= position.x &&
            position.x <= (self.rect?.frame.maxX)! &&
            (self.rect?.frame.minY)! <= position.y &&
            position.y <= (self.rect?.frame.maxY)!
    }
    
}

