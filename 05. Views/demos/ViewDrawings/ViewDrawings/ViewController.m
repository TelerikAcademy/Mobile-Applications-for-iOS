//
//  ViewController.m
//  ViewDrawings
//
//  Created by Doncho Minkov on 10/29/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "ViewController.h"
#import "DrawingsCanvas.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect = CGRectMake(60, 160, 160,230);
    
    UIView* subview = [[DrawingsCanvas alloc] initWithFrame:rect];
    
    [self.view addSubview:subview];
    subview.backgroundColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
