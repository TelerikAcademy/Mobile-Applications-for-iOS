//
//  Superhero.h
//  SQLiteDemos
//
//  Created by Doncho Minkov on 2/3/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Superhero : NSObject

@property (strong, nonatomic) NSString *name;

-(instancetype) initWithName: (NSString*) name;

+(Superhero*) superheroWithName: (NSString*) name;

@end
