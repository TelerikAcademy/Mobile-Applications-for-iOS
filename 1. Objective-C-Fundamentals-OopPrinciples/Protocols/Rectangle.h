//
//  Rectangle.h
//  2. Protocols
//
//  Created by Doncho Minkov on 10/22/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shape.h"
#import "Resizable.h"

@interface Rectangle : NSObject<Shape, Resizable>

-(instancetype) initWithX: (double) x
                        y:(double) y
                    width:(double) width
                andHeight:(double) height;

-(instancetype) initWithWidth: (double) width
                    andHeight: (double) height;

@end
