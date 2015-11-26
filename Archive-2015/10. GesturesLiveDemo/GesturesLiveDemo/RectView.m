//
//  RectView.m
//  GesturesLiveDemo
//
//  Created by Doncho Minkov on 11/3/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "RectView.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation RectView

-(void)drawRect: (CGRect) rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *color = [UIColor blueColor];
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
}

@end
