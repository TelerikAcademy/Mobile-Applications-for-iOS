//
//  ViewController.m
//  LoadingNibFiles
//
//  Created by Doncho Minkov on 10/29/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

static NSString* viewIdentifier = @"DetailsView";

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray* nibs = [[NSBundle mainBundle] loadNibNamed:@"DetailsView"
                                                     owner:self
                                                options:nil];
    UIView *subview = (UIView*)[nibs objectAtIndex:0];
    
//    [self.view addSubview:subview];
    
    CGRect rect = CGRectMake(50, 50, 30, 75);
    UIButton *but = [[UIButton alloc] initWithFrame:rect];
//    but.backgroundColor = [UIColor blackColor];
//    but.titleLabel.font = [UIFont boldSystemFontOfSize:28];
//    but.titleLabel.textColor = [UIColor yellowColor];
//    but.titleLabel.text = @"Click";
    
    [self.view addSubview:but];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
