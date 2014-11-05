//
//  ViewController.m
//  TestAnimations
//
//  Created by Doncho Minkov on 11/5/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "ViewController.h"
#import "MyLayer.h"

@interface ViewController () <UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>

@end

@implementation ViewController
{
    UIView *_view;
    MyLayer *_layer;
    BOOL _animating;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    _view = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
//    _view.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:_view];
    
    self.view.backgroundColor= [UIColor colorWithRed:(arc4random()%100)/100.
                                            green:(arc4random()%100)/100.
                                             blue:(arc4random()%100)/100. alpha:1.];

    
    _layer = [MyLayer new];
    _layer.backgroundColor = [UIColor redColor].CGColor;
    _layer.cornerRadius = 50;
    _layer.frame = CGRectMake(50, 50, 100, 100);
    _layer.radius = 10;
    [self.view.layer addSublayer:_layer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//}
//
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch = [touches anyObject];
//    CGPoint point = [touch locationInView:self.view];
//    CGPoint originalPoint = _layer.position;
//    _layer.position = point;
//    CABasicAnimation *a = [CABasicAnimation animationWithKeyPath:@"radius"];
//    a.fromValue = [NSValue valueWithCGPoint:originalPoint];
//    a.toValue = [NSValue valueWithCGPoint:point];
//    a.duration = 0.2;
//    [_layer addAnimation:a forKey:@"a"];
//}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *container = [transitionContext containerView];
    UIViewController *to = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *from = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [container addSubview:to.view];
    to.view.transform = CGAffineTransformMakeTranslation(container.bounds.size.width, 0);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                           delay:0
          usingSpringWithDamping:.5
           initialSpringVelocity:.1
                         options:UIViewAnimationOptionCurveEaseInOut
                      animations:^{
                          
                          to.view.transform = CGAffineTransformIdentity;
                          
                      } completion:^(BOOL finished) {
                          [transitionContext completeTransition:finished];
                      }];
    
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    ViewController *v = [ViewController new];
    v.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    v.transitioningDelegate = self;
    [self presentViewController:v animated:YES completion:^{
    }];
    
//    [UIView animateWithDuration:0.5
//                          delay:0
//         usingSpringWithDamping:0.5
//          initialSpringVelocity:0.2
//                        options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionLayoutSubviews
//                     animations:^{
//                         _view.center = CGPointMake(200, 400);
//                         [_view setNeedsLayout];
//                     } completion:^(BOOL finished) {
//                     }];
    
    
//    if (_animating) {
//        [_layer removeAnimationForKey:@"a"];
//    }
//    else {
//        _layer.radius = 40;
//        CABasicAnimation *a = [CABasicAnimation animationWithKeyPath:@"radius"];
//        a.fromValue = @10;
//        a.toValue = @40;
//        a.duration = 20;
//        [_layer addAnimation:a forKey:@"a"];
//    }
//    _animating = !_animating;
////    [_layer removeAllAnimations];
//    _layer.speed = 100000;
    
//    _layer.position = CGPointMake(200, 400);
//    CABasicAnimation *a = [CABasicAnimation animationWithKeyPath:@"position"];
//    a.fromValue = [NSValue valueWithCGPoint:point];
//    a.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 400)];
//    a.duration = 1;
//    a.delegate = self;
////    a.repeatCount = 10000;
////    a.removedOnCompletion = NO;
//    a.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//    [_layer addAnimation:a forKey:nil];
    
//    _layer.opacity = 0.5;
//    CAKeyframeAnimation *a2 = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
//    a2.values = @[ @1, @1, @0.5 ];
//    a2.keyTimes = @[ @0, @0.5, @1 ];
//    a2.duration = 2;
////    a2.fromValue = @1;
////    a2.toValue = @0.5;
////    a2.duration = 1;
////    [_layer addAnimation:a2 forKey:nil];
//    
//    CAAnimationGroup *g = [CAAnimationGroup new];
//    g.animations = @[a, a2];
//    g.duration = 1;
//    g.speed = 0.4;
//    [_layer addAnimation:g forKey:nil];
}

//- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
//{
//    _layer.opacity = 0.5;
//    CABasicAnimation *a2 = [CABasicAnimation animationWithKeyPath:@"opacity"];
//    a2.fromValue = @1;
//    a2.toValue = @0.5;
//    a2.duration = 1;
//    [_layer addAnimation:a2 forKey:nil];
//}
//


















@end
