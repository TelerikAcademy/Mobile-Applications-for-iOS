//
//  ViewController.h
//  WorkingWithLocation
//
//  Created by Doncho Minkov on 10/31/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelLatitude;
@property (weak, nonatomic) IBOutlet UILabel *labelLongitude;

- (IBAction)swipe:(UISwipeGestureRecognizer *)sender;

@end