//
//  DMCourseModel.m
//  TelerikAcademyCourses
//
//  Created by Doncho Minkov on 2/4/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "DMCourseModel.h"

@implementation DMCourseModel

-(instancetype)initWithId:(NSString *)courseId andTitle:(NSString *)title {
    if(self = [super init]){
        self.courseId = courseId;
        self.title= title;
    }
    return self;
}


-(instancetype)initWithDict:(NSDictionary *)dict {
    return [self initWithId: [dict objectForKey: @"id"]
                    andTitle: [dict objectForKey:@"title"] ];
}

+(DMCourseModel *)courseWithId:(NSString *)courseId andTitle:(NSString *)title  {
    return [[DMCourseModel alloc] initWithId:courseId andTitle: title];
}

-(NSDictionary *)dict {
    return @{
             @"title": self.title,
             @"id": self.courseId
             };
}

@end
