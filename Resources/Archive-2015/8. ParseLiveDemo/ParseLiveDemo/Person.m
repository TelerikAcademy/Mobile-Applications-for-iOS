//
//  Person.m
//  ParseLiveDemo
//
//  Created by Doncho Minkov on 10/31/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "Person.h"

@implementation Person{
    NSString* _name;
}

@dynamic name;
@dynamic age;

+(NSString *)parseClassName{
    return @"Person";
}

+(void)load{
    [self registerSubclass];
}
//
//-(void)setName:(NSString *)name{
//    self[@"name"] = name;
//    _name = name;
//}

@end
