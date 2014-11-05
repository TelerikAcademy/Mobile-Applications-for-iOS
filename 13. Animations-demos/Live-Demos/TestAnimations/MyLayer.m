//
//  MyLayer.m
//  TestAnimations
//
//  Created by Doncho Minkov on 11/5/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyLayer.h"

@implementation MyLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.needsDisplayOnBoundsChange = YES;
    }
    return self;
}

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([key isEqualToString:@"radius"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (instancetype)initWithLayer:(id)layer
{
    self = [super initWithLayer:layer];
    if (self) {
        self.radius = ((MyLayer*)layer).radius;
    }
    return self;
}

- (id<CAAction>)actionForKey:(NSString *)event
{
    return  nil;
}

- (void)drawInContext:(CGContextRef)ctx
{
    CGFloat diam = _radius * 2;
    CGRect rect = CGRectMake(self.bounds.size.width/2. - _radius,
                             self.bounds.size.height/2. - _radius, diam, diam);
    CGContextSetStrokeColorWithColor(ctx, [UIColor yellowColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, rect);
}

@end
