//
//  ViewController.swift
//  AnimationsDemos
//
//  Created by Doncho Minkov on 3/29/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

class DynamicBehaviorViewController: UIViewController {
    var tapGesture: UITapGestureRecognizer?
    var animator: UIDynamicAnimator?
    var gravityToRight: UIGravityBehavior?
    var gravityToLeft: UIGravityBehavior?
    var collision: UICollisionBehavior?
    
    
    var isAnimating = false
    
    override func viewWillAppear(_ animated: Bool) {
        isAnimating = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        isAnimating = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        self.view.addGestureRecognizer(self.tapGesture!)
        
        self.gravityToRight = UIGravityBehavior()
        gravityToRight?.angle = 0.75
        
        self.gravityToLeft = UIGravityBehavior()
        gravityToLeft?.angle = 1
        
        self.collision = UICollisionBehavior()
        
        self.animator = UIDynamicAnimator(referenceView: self.view)
        self.animator?.addBehavior(self.gravityToRight!)
//        self.animator?.addBehavior(self.gravityToLeft!)
        
        self.collision?.translatesReferenceBoundsIntoBoundary = true
        self.animator?.addBehavior(self.collision!)
        
        let obstacle = UIView(frame: CGRect(x: 200, y: 500, width: 400, height: 10))
        obstacle.backgroundColor = .black
        
//        self.view.addSubview(obstacle)
        self.collision?.addBoundary(withIdentifier: "obstracle" as NSCopying,
                                    from: CGPoint(x: 200, y: 500),
                                    to: CGPoint(x: 600, y: 510))
        
//        self.addRect()
    }
    
    func addRect() {
        if !isAnimating {
            return
        }
        
        let timeout = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: timeout) {
            let part = Int(self.view.bounds.width / 10)
            for i in 0..<5 {
                let rect = UIView(frame: CGRect(x: part * i, y: 0, width: 30, height: 30))
                rect.backgroundColor = .red
                self.view.addSubview(rect)
                self.gravityToRight?.addItem(rect)
                self.collision?.addItem(rect)
            }
            
            for i in 5..<10 {
                let rect = UIView(frame: CGRect(x: part * i, y: 0, width: 30, height: 30))
                rect.backgroundColor = .red
                self.view.addSubview(rect)
                self.gravityToLeft?.addItem(rect)
                self.collision?.addItem(rect)
            }
            self.addRect()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tap(){
        print("tapped")
    }
}

