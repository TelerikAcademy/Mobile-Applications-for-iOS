//
//  DrawingCanvas.swift
//  CoreGraphicsDemos
//
//  Created by Doncho Minkov on 2/2/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

import UIKit

class DrawingCanvas: UIView {
    override func drawRect(rect: CGRect) {
        
        var x: CGFloat = rect.midX - 100
        var y: CGFloat = rect.midY - 100
        var w: CGFloat = 200
        var h: CGFloat = 200
        
        var red: CGFloat;
        var green: CGFloat;
        var blue: CGFloat;
        let count = 10
        
        for i in (0...count) {
            x += 10
            y += 10
            w -= 20
            h -= 20
            let rect = CGRectMake(x, y, w, h);
            let color = Double(i + 1)/Double(count) * 255.0;
            red = CGFloat(color / 255.0)
            green = CGFloat(color / 255.0)
            blue = CGFloat(color / 255.0)
            let fillColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
            self.drawEllipseIn(rect, withFill: fillColor, andStrokeColor: UIColor.blackColor())
        }
    }
    
    func drawEllipseIn(rect: CGRect, withFill fillColor: UIColor, andStrokeColor strokeColor: UIColor) {
        fillColor.setFill();
        strokeColor.setStroke();
        let path = UIBezierPath(ovalInRect: rect);
        path.fill();
        path.stroke()
    }
}
