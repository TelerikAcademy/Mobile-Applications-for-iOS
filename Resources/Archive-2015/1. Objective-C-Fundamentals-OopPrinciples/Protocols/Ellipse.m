//
//  Circle.m
//  2. Protocols
//
//  Created by Doncho Minkov on 10/22/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "Ellipse.h"

@implementation Ellipse

@synthesize x;
@synthesize y;
@synthesize width;
@synthesize height;

-(instancetype)initWithRadius:(double)r{
    return [self initWithR1:r andR2:r];
}

-(instancetype) initWithR1:(double)r1 andR2:(double)r2{
    return [self initWithCx:DEFAULT_X_POSITION cY:DEFAULT_Y_POSITION R1:r1 andR2:r2];
}

-(instancetype)initWithCx:(double)x cY:(double)y andRadius:(double)r{
    return [self initWithCx:x cY:y R1:r andR2:r];
}

-(instancetype)initWithCx:(double)x cY:(double)y R1:(double)r1 andR2:(double)r2{
    self = [super init];
    if(self){
        self.x = x;
        self.y = y;
        self.r1 = r1;
        self.r2 = r2;
    }
    return self;
}

-(double)width{
    return 2 * self.r1;
}
-(double) height{
    return 2 * self.r2;
}

-(double)x{
    return self.cx;
}

-(double) y{
    return self.cy;
}

/* Shape methods */

-(void) moveToX: (double) x andY: (double) y{
    self.x = x;
    self.y = y;
}
-(double) calculatePerimeter{
    return M_PI * (3*(self.r1 + self.r2) - sqrt((3*self.r1 + self.r2)* (self.r1 + 3* self.r2)));
}
-(double) calculateArea{
    return M_PI * self.r1 * self.r2;
}

/* Resizable methods */
-(void) resizeWidth: (double) width{
    self.r1 = width;
}
-(void) resizeHeight: (double) height{
    self.r2 = height;
}
-(void) resizeWidth: (double) width
          andHeight: (double) height{
    [self resizeWidth:width];
    [self resizeHeight:height];
}
@end
