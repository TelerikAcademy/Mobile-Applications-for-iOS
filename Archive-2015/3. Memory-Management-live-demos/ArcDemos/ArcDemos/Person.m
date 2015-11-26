//
//  Person.m
//  ArcDemos
//
//  Created by Doncho Minkov on 10/28/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "Person.h"

@implementation Person

-(instancetype)init{
    __weak id weakSelf = self;
    [self fetchDate: ^(int, int):{
        weakSelf.data = receivedData;
    }];
}

@end
