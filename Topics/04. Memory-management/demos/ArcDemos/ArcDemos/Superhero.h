//
//  Person.h
//  ArcDemos
//
//  Created by Doncho Minkov on 1/26/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Superhero : NSObject

@property (strong, nonatomic) NSString *name;

@property (strong, nonatomic) NSArray *powers;

-(instancetype)initWithName: (NSString*) name
                   andPower: (NSArray*) powers;

+(Superhero*) superheroWithName: (NSString*) name
                      andPowers: (NSArray*) powers;

@end
