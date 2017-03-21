//
//  DMSuperhero.h
//  HTTPRequests
//
//  Created by Doncho Minkov on 1/27/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMSuperhero : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray *powers;

-(instancetype)initWithName: (NSString*) name
                  andPowers: (NSArray*) powers;

+(DMSuperhero*) superheroWithName: (NSString*) name
                        andPowers: (NSArray*) powers;
@end
