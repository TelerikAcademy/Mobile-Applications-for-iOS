//
//  AnimatedView.swift
//  AnimationsDemo
//
//  Created by Doncho Minkov on 2/2/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

import UIKit

class AnimatedView: UIView {
    
    var isAnimated = false
    
    func touchesBegan() {
        if(isAnimated) {
            self.animate(self)
        }
        else {
            self.layer.removeAllAnimations()
        }
        self.isAnimated = !self.isAnimated
    }
    
    func animate(view: UIView) {
        let duration = 1.0;
        
        UIView.animateWithDuration(duration, delay: 0.0, options: UIViewAnimationOptions.Autoreverse , animations: { () -> Void in
            view.alpha = 0.0
            }) { (Bool) -> Void in
                print("Finished!");
                view.alpha = 1.0
                self.animate(view);
        }
    }
}
