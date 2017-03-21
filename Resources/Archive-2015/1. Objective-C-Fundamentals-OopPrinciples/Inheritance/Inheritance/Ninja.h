//
//  Ninja.h
//  1. Inheritance
//
//  Created by Doncho Minkov on 10/22/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Ninja : Person

@property int rank;

-(instancetype) initWithRank: (int) rank;

-(void) fight;

@end
