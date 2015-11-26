//
//  Person.m
//  MemoryManagementDemos
//
//  Created by Doncho Minkov on 10/28/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "Person.h"

@implementation Person

-(instancetype)initWithName:(NSString *)name{
    self = [super init];
    if(self){
        self.name = name;
    }
    return self;
}


+(Person *)personWithName:(NSString *)name{
    Person* person = [[Person alloc] initWithName:name];
    return [person autorelease];
}

-(void)dealloc{
    [super dealloc];
}

@end
