//
//  ViewController.m
//  GesturesLiveDemo
//
//  Created by Doncho Minkov on 11/3/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "ViewController.h"
#import <CoreGraphics/CoreGraphics.h>
#import "RectView.h"

@interface ViewController ()

@property (nonatomic, strong) RectView* rectView;

@property CGFloat rotationAngle;
@property CGFloat scaleFactor;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scaleFactor = 1;
    self.rotationAngle = 0;
    
    NSInteger side = 60;
    
    NSInteger x = self.view.bounds.origin.x + (self.view.bounds.size.width - side)/2;
    NSInteger y = self.view.bounds.origin.y + (self.view.bounds.size.height - side)/2;
    
    CGRect rect = CGRectMake(x, y, side, side);
    
    RectView* rectView = [[RectView alloc] initWithFrame:rect];
    
    [self.view addSubview:rectView];
    
    rectView.transform = CGAffineTransformMakeScale(1, 1);
    
    self.rectView = rectView;
    
    //    UISwipeGestureRecognizer *rightSwipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
    //                                                                                               action:@selector(swipe:)];
    //
    //    UISwipeGestureRecognizer *leftSwipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
    //                                                                                              action:@selector(swipe:)];
    //    leftSwipeRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    //
    //    [self.view addGestureRecognizer:rightSwipeRecognizer];
    //    [self.view addGestureRecognizer:leftSwipeRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)swipe:(UISwipeGestureRecognizer *)recognizer {
    NSString *message;
    switch (recognizer.direction) {
        case UISwipeGestureRecognizerDirectionRight:
            message = @"Swiped right";
            break;
        case UISwipeGestureRecognizerDirectionLeft:
            message = @"Swiped left";
            break;
        default:
            message =@"Not swiped";
            break;
    }
    NSLog(@"%@", message);
}

- (IBAction)pinch:(UIPinchGestureRecognizer *)sender {
    //initial scale 1
    //    CGFloat scaleFactor = self.scaleFactor * sender.scale;
    CGFloat scaleFactor = sender.scale;
    
    //    CGAffineTransform currentTrans = self.rectView.transform;
    //
    CGAffineTransform transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
    
    self.scaleFactor = scaleFactor;
    
    self.rectView.transform = CGAffineTransformRotate(transform, self.rotationAngle);
}

- (IBAction)rotate:(UIRotationGestureRecognizer *)sender {
    //initial 0
    
    self.rotationAngle = sender.rotation;
    
    CGAffineTransform transform = CGAffineTransformMakeScale( self.scaleFactor, self.scaleFactor);
    
    self.rectView.transform = CGAffineTransformRotate(transform, self.rotationAngle);
}

- (IBAction)pan:(UIPanGestureRecognizer *)sender {
    CGPoint panLocation = [sender locationInView:self.view];
    
    CGRect rectViewBounds = self.rectView.frame;
    
    if(![self panAt:panLocation isInRect: rectViewBounds]){
        return;
    }
    
    CGFloat offsetX = -self.view.bounds.size.width/2;
    CGFloat offsetY = -self.view.bounds.size.height/2;
    
    CGFloat tx = self.scaleFactor * (panLocation.x + offsetX);
    CGFloat ty = self.scaleFactor * (panLocation.y + offsetY);
    
    self.rectView.transform = CGAffineTransformIdentity;
    
    CGAffineTransform transform = CGAffineTransformMakeScale(self.scaleFactor, self.scaleFactor);
    transform = CGAffineTransformRotate(transform, self.rotationAngle);
    transform = CGAffineTransformTranslate(transform, tx, ty);
    
    self.rectView.transform = transform;
}

-(BOOL) panAt: (CGPoint) point isInRect: (CGRect) rect{
    CGFloat margin = 15;
    CGFloat top = rect.origin.y - margin;
    CGFloat bottom = rect.origin.y + rect.size.height + margin;
    CGFloat left = rect.origin.x - margin;
    CGFloat right = rect.origin.x + rect.size.width + margin;
    return (left <= point.x && point.x <= right) &&
    (top <= point.y && point.y <= bottom);
}
@end
