//
//  ViewController.m
//  MemoryManagementiOS
//
//  Created by Doncho Minkov on 1/26/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //+1
    __weak id weakSelf = self;
    //block (lambda)
        //0
        [weakSelf reloadData];
    
}

-(void) tap {
    NSLog(@"Tapped");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
