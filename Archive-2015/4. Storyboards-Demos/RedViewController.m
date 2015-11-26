//
//  RedViewController.m
//  StoryboardsDemos
//
//  Created by Doncho Minkov on 10/28/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "RedViewController.h"

@interface RedViewController ()

@end

@implementation RedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)returnToRed:(UIStoryboardSegue *) segue{
    NSLog(@"Back to Red");
}

@end
