//
//  ViewController.m
//  TA
//
//  Created by wfmac on 11/4/14.
//  Copyright (c) 2014 eweqw. All rights reserved.
//

#import "ViewController.h"
#import "MyLayer.h"

@interface ViewController () <UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 200, 45)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"Transition" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonTouched:(id)sender
{
    ViewController *vc = [ViewController new];
    vc.view.backgroundColor = [UIColor colorWithRed:(arc4random()%100)/100.
                                              green:(arc4random()%100)/100.
                                               blue:(arc4random()%100)/100.
                                              alpha:1.];
//    vc.transitioningDelegate = self;
//    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:^{}];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *to = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    to.view.transform = CGAffineTransformMakeTranslation(containerView.bounds.size.width, 0);
    [containerView addSubview:to.view];
    
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.5
          initialSpringVelocity:0.1
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         to.view.transform = CGAffineTransformIdentity;
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:finished];
                     }];
}

@end
