//
//  PopUpViewController.swift
//  AnimationsDemos
//
//  Created by Doncho Minkov on 3/29/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    var animator: UIDynamicAnimator?
    var gravity: UIGravityBehavior?
    var collision: UICollisionBehavior?
    
    var popUp: UIView?
    
    var btnShowPopUp: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Button")
        
        self.btnShowPopUp = UIButton(frame: CGRect(x: self.view.bounds.width/2, y: 20, width: 400, height: 50))
        self.btnShowPopUp?.titleLabel?.text = "Show Popup"
        self.btnShowPopUp?.backgroundColor = .black
        
        self.btnShowPopUp?.addTarget(self, action: #selector(showPopup), for: .touchUpInside)
        
        self.view.addSubview(self.btnShowPopUp!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func showPopup() {
        if(self.popUp != nil) {
            return
        }
        let popUpWidth: CGFloat = 300
        let popUpHeight: CGFloat = 150
        let x = CGFloat(self.view.bounds.width)
        let y = CGFloat((self.view.bounds.height - popUpHeight) / 2)
        self.popUp = UIView(frame: CGRect(x: x,
                                          y: y,
                                          width: popUpWidth,
                                          height: popUpHeight))
        
        self.popUp?.backgroundColor = .red
        
        self.view.addSubview(self.popUp!)
        
        self.gravity = UIGravityBehavior(items: [self.popUp!])
        
        self.gravity?.angle = 1 * 3.14
        self.collision = UICollisionBehavior(items: [self.popUp!])
        self.collision?.addBoundary(withIdentifier: "left wall" as NSCopying, from: CGPoint(x: 0, y: 0), to: CGPoint(x: 0, y: self.view.bounds.height))
//        self.collision?.translatesReferenceBoundsIntoBoundary = true
        
        self.animator = UIDynamicAnimator(referenceView: self.view)
        
        self.animator?.addBehavior(self.gravity!)
        self.animator?.addBehavior(self.collision!)
        
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
