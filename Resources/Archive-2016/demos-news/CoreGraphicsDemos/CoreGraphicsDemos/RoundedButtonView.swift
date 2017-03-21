//
//  RoundedButtonView.swift
//  CoreGraphicsDemos
//
//  Created by Doncho Minkov on 2/2/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

import UIKit

class RoundedButtonView: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
    
    override func drawRect(rect: CGRect) {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: .AllCorners,
            cornerRadii: CGSize(width: 15, height: 15))
        
        UIColor.purpleColor().setFill();
        
        path.fill();
    }
}
