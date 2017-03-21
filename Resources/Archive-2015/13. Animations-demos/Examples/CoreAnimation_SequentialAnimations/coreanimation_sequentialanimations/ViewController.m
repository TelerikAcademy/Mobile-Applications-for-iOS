//
//  ViewController.m
//  CoreAnimation_SequentialAnimations
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
	// Do any additional setup after loading the view, typically from a nib.
    
    layer = [[CALayer alloc] init];
    layer.frame = (CGRect){ 50, 50, 100, 100};
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    layer.position = (CGPoint){ 100, 400 };
    
    CABasicAnimation *a = [CABasicAnimation animationWithKeyPath:@"position"];
    a.fromValue = [NSValue valueWithCGPoint:(CGPoint){ 100, 100 }];
    a.toValue = [NSValue valueWithCGPoint:(CGPoint){ 100, 400}];
    a.duration = 1;
    [layer addAnimation:a forKey:nil];
    
    layer.opacity = 0.3;
    
    CAKeyframeAnimation *a2 = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    a2.values = @[ @1., @1., @0.3 ];
    a2.keyTimes = @[ @0, @0.5, @1 ];
    a2.duration = 2;
    [layer addAnimation:a2 forKey:nil];
}

@end
