//
//  Circle.h
//  2. Protocols
//
//  Created by Doncho Minkov on 10/22/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Resizable.h"
#import "Shape.h"

@interface Ellipse : NSObject<Shape, Resizable>
@property double r1;
@property double r2;
@property double cx;
@property double cy;

-(instancetype) initWithRadius: (double) r;

-(instancetype) initWithR1: (double) r1
                    andR2:(double) r2;

-(instancetype) initWithCx: (double) x
                        cY:(double) y
                andRadius: (double) r;

-(instancetype) initWithCx: (double) x
                        cY:(double) y
                R1: (double) r1
          andR2: (double) r2;

@end
