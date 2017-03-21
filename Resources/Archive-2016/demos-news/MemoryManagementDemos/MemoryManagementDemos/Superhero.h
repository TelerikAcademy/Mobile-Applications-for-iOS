//
//  Superhero.h
//  MemoryManagementDemos
//
//  Created by Doncho Minkov on 1/26/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Superhero : NSObject

@property NSString *name;

-(instancetype)initWithName: (NSString*) name;

-(Superhero*) superheroWithName: (NSString*) name;


@end
