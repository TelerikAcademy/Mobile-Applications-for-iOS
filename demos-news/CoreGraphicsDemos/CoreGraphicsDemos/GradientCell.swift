//
//  GradientCell.swift
//  CoreGraphicsDemos
//0
//  Created by Doncho Minkov on 2/2/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

import UIKit

class GradientCell: UITableViewCell {
    
    override func drawRect(rect: CGRect) {
        self.drawGradient(rect);
        
        let path = UIBezierPath()
        
        path.moveToPoint(CGPointMake(CGRectGetMinX(rect) + 10
            , CGRectGetMaxY(rect)));
        
        path.addLineToPoint(CGPointMake(CGRectGetMaxX(rect) - 10
            , CGRectGetMaxY(rect)))
        
        UIColor.blackColor().setStroke()
        path.stroke()
    }
    
    func drawGradient(rect: CGRect) {
        let colors = [UIColor.whiteColor().CGColor,
            UIColor(red: 200.0/255,
                green: 200.0/255, blue: 200.0/255, alpha: 1).CGColor];
        
        let locations: [CGFloat] = [0.0, 1.0];
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let gradient = CGGradientCreateWithColors(colorSpace,  colors, locations)
        
        let context = UIGraphicsGetCurrentContext()
        
        let x = CGRectGetMinX(rect);
        let startY = CGRectGetMinY(rect);
        let endY = CGRectGetMaxY(rect);
        
        
        let startPoint = CGPointMake(x, startY);
        let endPoint = CGPointMake(x, endY);
        
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, .DrawsBeforeStartLocation);
    }
    
}
