//
//  Rectangle.m
//  2. Protocols
//
//  Created by Doncho Minkov on 10/22/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle

@synthesize x; @synthesize y;
@synthesize width; @synthesize height;

-(instancetype)initWithWidth:(double)width andHeight:(double)height{
    return [self initWithX:0 y:0 width:width andHeight:height];
}

-(instancetype)initWithX:(double)x
                       y:(double)y
                   width:(double)width
               andHeight:(double)height{
    self = [super init];
    if(self){
        self.x = x;
        self.y = y;
        self.width = width;
        self.height = height;
    }
    return self;
}

/* Shape methods */

-(double)calculateArea{
    return self.x * self.y;
}

-(double)calculatePerimeter{
    return 2 * (self.x + self.y);
}

-(void)moveToX:(double)x andY:(double)y{
    self.x = x;
    self.y = y;
}

/* Resizable methods */

-(void)resizeWidth:(double)width{
    self.width = width;
}

-(void)resizeHeight:(double)height{
    self.height = height;
}

-(void)resizeWidth:(double)width andHeight:(double)height{
    [self resizeWidth:width];
    [self resizeHeight:height];
}

@end
