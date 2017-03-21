//
//  Scene1ViewController.m
//  StoryboardsDemos
//
//  Created by Doncho Minkov on 10/28/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "Scene1ViewController.h"
#import "Scene2ViewController.h"

@interface Scene1ViewController ()

@end

@implementation Scene1ViewController

-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"disappeared");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numbers = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
    NSLog(@"loaded");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"appeared");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSDate*) getDate{
    //    [NSDate date] set
    return [NSDate date];
    
    //    return self.datePicker.date;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue
                sender:(id)sender{
    NSString* toScene2Identifier = @"toScene2Segue";
    if([segue.identifier isEqualToString:toScene2Identifier]){
        Scene2ViewController* toVC = segue.destinationViewController;
        toVC.numbers = self.numbers;
    }
}

-(IBAction)returnToPurple:(UIStoryboardSegue*) segue{
    NSLog(@"Back to purple");
//    NSLog(@"%@", [self.numbers componentsJoinedByString:@", "]);
}
@end
