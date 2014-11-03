//
//  ViewController.m
//  WorkingWithLocation
//
//  Created by Doncho Minkov on 10/31/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "ViewController.h"
#import "TALocationProvider.h"

@interface ViewController ()

@end

@implementation ViewController {
    TALocationProvider* locationProvider;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    locationProvider = [[TALocationProvider alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) locationUpdated: (CLLocation*) location{
    NSString* locationMessage = [NSString stringWithFormat:@"Your position is (%lf, %lf)",
                                 location.coordinate.latitude,
                                 location.coordinate.longitude];
    
    [[[UIAlertView alloc] initWithTitle:@"Location updated with target-action"
                                message:locationMessage
                               delegate:nil
                      cancelButtonTitle:@"Ok"
                      otherButtonTitles:nil, nil]
     show];
}

- (IBAction)swipe:(UISwipeGestureRecognizer *)sender {
    
    [locationProvider getLocationWithTarget:self
                                  andAction:@selector(locationUpdated:)];
    //    [locationProvider getLocationWithBlock:^(CLLocation *location) {
    //        NSString* locationMessage = [NSString stringWithFormat:@"Your position is (%lf, %lf)",
    //                                     location.coordinate.latitude,
    //                                     location.coordinate.longitude];
    //
    //        [[[UIAlertView alloc] initWithTitle:@"Location updated"
    //                                    message:locationMessage
    //                                   delegate:nil
    //                          cancelButtonTitle:@"Ok"
    //                          otherButtonTitles:nil, nil]
    //         show];
    //    }];
}
@end