//
//  TopicViewCell.m
//  TelerikAcademyCourses
//
//  Created by Doncho Minkov on 2/6/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "DMTopicViewCell.h"

@interface DMTopicViewCell()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation DMTopicViewCell


-(void)drawRect:(CGRect)rect {

    [self drawGradient:rect];
    UIBezierPath *path = [UIBezierPath bezierPath];

    [path moveToPoint: CGPointMake(CGRectGetMinX(rect) + 10
                             , CGRectGetMaxY(rect))];

    [path addLineToPoint:CGPointMake(CGRectGetMaxX(rect) - 10, CGRectGetMaxY(rect))];

    [[UIColor blackColor] setStroke];
    [path stroke];
}

-(void) drawGradient:(CGRect) rect {
    NSArray *colors = @[(id)[UIColor whiteColor].CGColor,
                        (id)[UIColor greenColor].CGColor];
    
    CGFloat locations[] = {0.0, 1.0};
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat x = CGRectGetMinX(rect);
    CGFloat startY = CGRectGetMinY(rect);
    CGFloat endY = CGRectGetMaxY(rect);
    
    CGPoint startPoint = CGPointMake(x, startY);
    CGPoint endPoint = CGPointMake(x, endY);
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
}

-(UILabel *)textLabel {
    return self.label;
}
@end
