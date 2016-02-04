//
//  ViewController.m
//  SQLiteLibDemos
//
//  Created by Doncho Minkov on 2/3/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

#import <FMDB.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [(AppDelegate *) ([UIApplication sharedApplication].delegate) applicationDocumentsDirectory]
    
    FMDatabase *db = [FMDatabase databaseWithPath:url.path];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
