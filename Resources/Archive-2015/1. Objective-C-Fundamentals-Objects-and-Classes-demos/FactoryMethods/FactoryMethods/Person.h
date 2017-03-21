//
//  Person.h
//  PropertiesWithGettersSetters
//
//  Created by Doncho Minkov on 2/10/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject


- (id)init;

- (id) initWithFirstname: (NSString *) fname
             andLastname: (NSString *) lname;

- (id) initWithFirstname: (NSString *) fname
             lastname: (NSString *) lname
                  andAge: (NSInteger) a;

+ (Person *) person;

+(Person *) personWithFirstname: (NSString *) fname
                    andLastname: (NSString *) lname;

+(Person *) personWithFirstname:(NSString *)fname
                    lastname:(NSString *)lname
                         andAge:(NSInteger) a;

@property (nonatomic, strong) NSString *firsname;
@property (nonatomic, strong) NSString *lastname;
@property NSInteger age;

@end
