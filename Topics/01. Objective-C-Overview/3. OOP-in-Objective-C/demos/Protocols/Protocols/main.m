//
//  main.m
//  Protocols
//
//  Created by Doncho Minkov on 10/22/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Shape.h"
#import "Resizable.h"
#import "Rectangle.h"
#import "Ellipse.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Rectangle *rect = [[Rectangle alloc] initWithX:5
                                                     y:10
                                                 width:40
                                             andHeight:50];
        
        Ellipse *ellipse = [[Ellipse alloc] initWithCx:5 cY:10 R1:10 andR2:15];
        
        NSArray *figures = @[ rect, ellipse];
        
        NSLog(@"Printing the shapes: ");
        for (id<Shape> shape in figures) {
            NSLog(@"Area: %lf, Perimeter: %lf", [shape calculateArea], [shape calculatePerimeter]);
        }
    }
    return 0;
}
