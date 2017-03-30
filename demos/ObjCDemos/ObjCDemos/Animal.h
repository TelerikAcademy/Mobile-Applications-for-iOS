//
//  Animal.h
//  ObjCDemos
//
//  Created by Doncho Minkov on 3/15/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mauable.h"

@interface Animal : NSObject<Mauable>

-(Animal*)init;

-(instancetype) initWithName: (NSString*) name;

+(Animal*) animalWithName: (NSString*) name;

@end
