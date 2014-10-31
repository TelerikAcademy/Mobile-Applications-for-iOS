//
//  ViewController.m
//  AppLifecycleDemos
//
//  Created by Doncho Minkov on 10/30/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    
//    [button setTitle:@"Click" forState:UIControlStateNormal];
//    [button setTitle:@"Clicked" forState:UIControlStateHighlighted];
//    button.backgroundColor = [UIColor yellowColor];
//    
//    
//    button.frame = CGRectMake(50, 50, 150, 170);
//    
//
//    UIView* subview = (UIView*) button;
//    [self.view addSubview:subview];
    
    
    
    
    
//    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
//    NSString* namesList = [app.names componentsJoinedByString:@", "];
//    NSLog(@"%@", namesList);
    
    
    
//    [app.everlive data:@"Persons"]
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSLog(@"View will appear");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    NSLog(@"View did appear");
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    NSLog(@"View will disappear");
    
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    NSLog(@"View did disappear");
    
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    NSLog(@"View will layout subviews");
    
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    NSLog(@"View did layout subviews");
}

-viewDId

-(IBAction) returnToMainView: (UIStoryboardSegue*)segue{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
