//
//  Scene2ViewController.m
//  StoryboardsDemos
//
//  Created by Doncho Minkov on 10/28/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "Scene2ViewController.h"

@interface Scene2ViewController ()

@end

@implementation Scene2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.labelData setText: [self formatDate:self.date]];
    [self.numbers addObject:@"Pesho"];
//     show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSString*) formatDate: (NSDate *) date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"hh:mm:ss"];
    return [formatter stringFromDate:date];
}
@end
