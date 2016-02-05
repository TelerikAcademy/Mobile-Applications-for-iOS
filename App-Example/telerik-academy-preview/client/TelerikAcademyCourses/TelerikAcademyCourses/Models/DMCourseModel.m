//
//  DMCourseModel.m
//  TelerikAcademyCourses
//
//  Created by Doncho Minkov on 2/4/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "DMCourseModel.h"

@implementation DMCourseModel

-(instancetype)initWithIdNumber:(NSNumber *)courseId andTitle:(NSString *)title {
    if(self = [super init]){
        self.courseId = courseId;
        self.title= title;
    }
    return self;
}

-(instancetype)initWithId:(NSInteger)courseId andTitle:(NSString *)title {
    return [self initWithIdNumber: [NSNumber numberWithInteger: courseId] andTitle:title];
}

-(instancetype)initWithDict:(NSDictionary *)dict {
    return [self initWithId: [[dict objectForKey: @"id"] integerValue]
                    andTitle: [dict objectForKey:@"title"] ];
}

+(DMCourseModel *)courseWithId:(NSInteger)courseId andTitle:(NSString *)title {
    return [[DMCourseModel alloc] initWithId:courseId andTitle:title];
}

+(DMCourseModel *)courseWithIdNumber:(NSNumber *)courseId andTitle:(NSString *)title  {
    return [[DMCourseModel alloc] initWithIdNumber:courseId andTitle: title];
}

-(NSDictionary *)dict {
    return @{
             @"title": self.title,
             @"id": self.courseId
             };
}

@end
