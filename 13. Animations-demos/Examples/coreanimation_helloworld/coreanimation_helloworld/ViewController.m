//
//  ViewController.m
//  CoreAnimation_HelloWorld
//
//  Created by wfmac on 12/2/13.
//  Copyright (c) 2013 raikov-local. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
{
    CALayer *layer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    layer = [[CALayer alloc] init];
    layer.frame = (CGRect){ 50, 50, 100, 100};
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    // remember, you should set the animated property if you want to keep the value when
    // the animation finishes
    layer.position = (CGPoint){ 100, 400 };
    
    CABasicAnimation *a = [CABasicAnimation animationWithKeyPath:@"position"];
    a.fromValue = [NSValue valueWithCGPoint:(CGPoint){ 100, 100 }];
    a.toValue = [NSValue valueWithCGPoint:(CGPoint){ 100, 400}];
    a.duration = 1;
    
    // add some easing
    //a.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    // make the easing custom
    //a.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.25 :.1 :.8 :.5];
    
    [layer addAnimation:a forKey:nil];
    
    // change the animation speed
    //layer.speed = 10;
}

@end
