//
//  DMCourseDetailsModel.h
//  TelerikAcademyCourses
//
//  Created by Doncho Minkov on 2/5/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMCourseModel.h"

@interface DMCourseDetailsModel : DMCourseModel

@property (strong, nonatomic) NSString * desc;
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSArray *topics;

-(instancetype) initWithId: (NSString *) courseId
                     title: (NSString *) title
               description: (NSString *) description
                      date: (NSDate *) date
                 andTopics: (NSArray *) topics;

-(instancetype)initWithDict:(NSDictionary *)dict;

+(DMCourseDetailsModel *) courseDetailsWithDict: (NSDictionary *) dict;

@end
