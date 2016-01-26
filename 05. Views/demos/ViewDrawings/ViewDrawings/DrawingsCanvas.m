//
//  DrawingsCanvas.m
//  ViewDrawings
//
//  Created by Doncho Minkov on 10/29/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "DrawingsCanvas.h"
#import <UIKit/UIKit.h>

@implementation DrawingsCanvas

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat cx = rect.origin.x + rect.size.width/2;
    CGFloat cy = rect.origin.y + rect.size.height/2;
    
    CGFloat maxRadius = rect.size.width/2;
    
    
//    CGContextSetStrokeColorWithColor(context, [[UIColor yellowColor] CGColor]);
    [[UIColor yellowColor] setStroke];
    [[UIColor brownColor] setFill];
    CGContextSetLineWidth(context, 5);
    
    
    CGContextScaleCTM(context, 1, 0.5);
    //    CGContextSetFillColor(context, 0.7, 0.6, 0.1, 0.4);
    for (CGFloat radius = maxRadius; radius > 0; radius -= 10) {
        CGContextAddArc(context, cx, cy, radius, 0, 2 * M_PI, YES);
        CGContextFillPath(context);
        CGContextStrokePath(context);
    }
    NSString* text = @"Hello!";
    UIFont *font = [UIFont boldSystemFontOfSize:18];
    
    CGSize textSize = [text sizeWithAttributes:@{
                                                 font: font
                                                 }];
    
    CGContextScaleCTM(context, 1, 2);
    CGRect textRect =CGRectMake(rect.origin.x + (rect.size.width - textSize.width)/2,
                                rect.origin.y + (rect.size.height - textSize.height)/2,
                                textSize.width, textSize.height);
    [[UIColor yellowColor] setStroke];
    [text drawInRect:textRect withAttributes:@{
                                               font: font
                                               }];
    
    
    
}
@end
