//
//  ViewController.h
//  GesturesLiveDemo
//
//  Created by Doncho Minkov on 11/3/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

-(IBAction) swipe: (UISwipeGestureRecognizer*) recognizer;
- (IBAction)pinch:(UIPinchGestureRecognizer *)sender;
- (IBAction)rotate:(UIRotationGestureRecognizer *)sender;
- (IBAction)pan:(UIPanGestureRecognizer *)sender;

@end

