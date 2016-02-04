//
//  DMDatabase.m
//  SQLiteLibDemos
//
//  Created by Doncho Minkov on 2/3/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//


#import "DMDatabase.h"

#import "AppDelegate.h"

#import <FMDB.h>


@implementation DMDatabase

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSURL *url = [(AppDelegate*)([UIApplication sharedApplication].delegate) applicationDocumentsDirectory];
        
        
//        FMDatabase *db = [FMDatabase databaseWithPath:@""];
    }
    return self;
}

@end
