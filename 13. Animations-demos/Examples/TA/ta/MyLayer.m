//
//  MyLayer.m
//  TA
//
//  Created by wfmac on 11/4/14.
//  Copyright (c) 2014 eweqw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyLayer.h"

@implementation MyLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.needsDisplayOnBoundsChange = YES;
        self.radius = 10;
    }
    return self;
}

- (instancetype)initWithLayer:(id)layer
{
    self = [super initWithLayer:layer];
    if (self) {
        self.radius = ((MyLayer*)layer).radius;
    }
    return self;
}

- (void)setRadius:(CGFloat)radius
{
    _radius = radius;
    [self setNeedsDisplay];
}

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([key isEqualToString:@"radius"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

//- (id<CAAction>)actionForKey:(NSString *)event
//{
//    return nil;
//}

- (void)drawInContext:(CGContextRef)ctx
{
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetLineWidth(ctx, 3);
    CGFloat diam = _radius*2;
    CGRect rect = CGRectMake(self.bounds.size.width/2. - _radius,
                             self.bounds.size.height/2. - _radius,
                             diam, diam);
    CGContextStrokeEllipseInRect(ctx, rect);
}

@end
