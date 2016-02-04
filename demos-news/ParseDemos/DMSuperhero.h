//
//  DMSuperhero.h
//  ParseDemos
//
//  Created by Doncho Minkov on 2/1/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface DMSuperhero : PFObject<PFSubclassing>

@property (strong, nonatomic) NSString *name;

+(NSString *)parseClassName;


+(DMSuperhero*) superheroWithName: (NSString*) name;
@end
