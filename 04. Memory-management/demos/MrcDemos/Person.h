//
//  Person.h
//  MemoryManagementDemos
//
//  Created by Doncho Minkov on 10/28/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, retain) NSString* name;

-(instancetype) initWithName: (NSString*) name;

+(Person *) personWithName: (NSString*) name;

@end
