//
//  GesturesViewController.swift
//  AnimationsDemos
//
//  Created by Doncho Minkov on 3/29/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

class GesturesViewController: UIViewController {
    var rect: UIView?
    var tapGesture: UITapGestureRecognizer?
    
    func getRandomColor() -> UIColor {
        let red: Float = (Float(arc4random()).truncatingRemainder(dividingBy: 10)) / 10
        let green: Float = (Float(arc4random()).truncatingRemainder(dividingBy: 10)) / 10
        let blue: Float = (Float(arc4random()).truncatingRemainder(dividingBy: 10)) / 10
        
        return UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: 255)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rect = UIView(frame: CGRect(x: 50, y: 50, width: 30, height: 30))
        self.rect?.layer.cornerRadius = 20
        self.rect?.backgroundColor = .black
        
        self.view.addSubview(rect!)
        self.tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        
        self.view.addGestureRecognizer(tapGesture!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var isNormalSize: Bool = true
    
    func tap() {
        weak var weakSelf = self
        let location = tapGesture?.location(in: self.view)
        
        UIView.animate(withDuration: 1, animations: {
            weakSelf?.rect?.backgroundColor = weakSelf?.getRandomColor()
            weakSelf?.rect?.frame.origin = location!
            
            weakSelf?.rect?.frame = CGRect(x: (location?.x)!,
                                           y: (location?.y)!,
                                           width: self.isNormalSize
                                            ? (weakSelf?.rect?.frame.width)!  - 25
                                            : (weakSelf?.rect?.bounds.width)! + 25,
                                           height: self.isNormalSize
                                            ? (weakSelf?.rect?.bounds.height)!  - 25
                                            : (weakSelf?.rect?.bounds.height)! + 25)
            weakSelf?.isNormalSize = !(weakSelf?.isNormalSize)!
        }, completion: { isAnimated in
            weakSelf?.tap()
        })
        //        UIView.animate(withDuration: 1) {
        //            weakSelf?.rect?.backgroundColor = weakSelf?.getRandomColor()
        //            weakSelf?.rect?.frame.origin = location!
        //            weakSelf?.rect?.frame = CGRect(x: (location?.x)!,
        //                                           y: (location?.y)!,
        //                                           width: self.isNormalSize
        //                                            ? (weakSelf?.rect?.frame.width)!  - 25
        //                                            : (weakSelf?.rect?.bounds.width)! + 25,
        //                                           height: self.isNormalSize
        //                                            ? (weakSelf?.rect?.bounds.height)!  - 25
        //                                            : (weakSelf?.rect?.bounds.height)! + 25)
        //            weakSelf?.isNormalSize = !(weakSelf?.isNormalSize)!
        //
        //        }
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
