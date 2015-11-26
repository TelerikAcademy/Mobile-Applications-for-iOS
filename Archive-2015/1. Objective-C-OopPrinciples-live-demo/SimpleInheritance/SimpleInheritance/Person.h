//
//  Person.h
//  SimpleInheritance
//
//  Created by Doncho Minkov on 10/27/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (strong, nonatomic, readonly) NSString* name;
@property int age;

@property (readonly) int personId;

-(instancetype) initWithName: (NSString *) name
                      andAge:(int) age;

+(Person*) personWithName: (NSString*) name
                   andAge:(int) age;

-(void) walk;

@end
