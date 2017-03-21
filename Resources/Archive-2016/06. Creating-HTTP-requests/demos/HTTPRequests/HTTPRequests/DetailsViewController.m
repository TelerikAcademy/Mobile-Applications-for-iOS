//
//  DetailsViewController.m
//  HTTPRequests
//
//  Created by Doncho Minkov on 1/27/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "DetailsViewController.h"

@implementation DetailsViewController

-(void)viewDidLoad  {
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"Details: %@", self.superhero.name, nil];
    self.titleLabel.text = [NSString stringWithFormat:@"Superhero: %@", self.superhero.name, nil];
    NSLog(@"%@", self.superhero);
}

@end
