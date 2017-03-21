//
//  ViewController.m
//  ParseDemos
//
//  Created by Doncho Minkov on 2/1/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "ViewController.h"
#import "DMSuperhero.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *superheroName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [PFQuery queryWithClassName:[DMSuperhero query]];
    
    DMSuperhero *hero = [DMSuperhero superheroWithName:@"Batman 2"];
    [hero saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        self.superheroName.text = hero.name;
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
