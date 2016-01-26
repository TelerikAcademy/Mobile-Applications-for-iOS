//
//  Shape.h
//  2. Protocols
//
//  Created by Doncho Minkov on 10/22/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DEFAULT_X_POSITION 0
#define DEFAULT_Y_POSITION 0

@protocol Shape <NSObject>

@property double x;
@property double y;

-(void) moveToX: (double) x andY: (double) y;
-(double) calculatePerimeter;
-(double) calculateArea;

@end
