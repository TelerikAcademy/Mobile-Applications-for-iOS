//
//  ViewController.m
//  UIKitDynamics_HelloWorld
//
//  Created by wfmac on 12/2/13.
//  Copyright (c) 2013 raikov-local. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
{
    UIDynamicAnimator *animator;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    UIDynamicItemBehavior
    // create a view that will be animated
    UIView *view = [[UIView alloc] initWithFrame:(CGRect){ 50, 50, 100, 100}];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    // create the UIKitDynamics animator that manages all behaviors
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    // add some gravity
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[view]];
//    gravity.magnitude = 10;
//    gravity.angle = M_PI_4;
    [animator addBehavior:gravity];
    
    // add collisions and make the equal to root view bounds
    UICollisionBehavior *collision =[[UICollisionBehavior alloc] initWithItems:@[view]];
    [collision setTranslatesReferenceBoundsIntoBoundary:YES];
    [animator addBehavior:collision];

    UIDynamicItemBehavior *dynamic = [[UIDynamicItemBehavior alloc] initWithItems:@[view]];
    dynamic.elasticity = 0.7;
    [animator addBehavior:dynamic];

    //
//    // add a push behavior
    UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[view] mode:UIPushBehaviorModeInstantaneous];
    push.pushDirection = CGVectorMake(0., 10.);
    [animator addBehavior:push];
//    
//
//    // finally, add some elasticity
}
@end
