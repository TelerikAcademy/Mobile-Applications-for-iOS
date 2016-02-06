//
//  DMCourseDetailsModel.m
//  TelerikAcademyCourses
//
//  Created by Doncho Minkov on 2/5/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "DMCourseDetailsModel.h"

@implementation DMCourseDetailsModel


-(instancetype)initWithId:(NSString *) courseId title:(NSString *)title description:(NSString *)description date:(NSDate *)date andTopics:(NSArray *)topics {
    if(self = [super initWithId:courseId andTitle:title]){
        self.desc = description;
        self.date = date;
        self.topics = topics;
        
    }
    return self;
}

-(instancetype)initWithDict:(NSDictionary *)dict {
    return [self initWithId: [dict objectForKey: @"id"]
                      title: [dict objectForKey: @"title"]
            description:[dict objectForKey:@"description"]
                       date:[NSDate date]
                  andTopics: [dict objectForKey:@"topics"]];
}

+(DMCourseDetailsModel *)courseDetailsWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
