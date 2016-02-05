//
//  DMCourseModel.h
//  TelerikAcademyCourses
//
//  Created by Doncho Minkov on 2/4/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMHttpDataModel.h"

@interface DMCourseModel : NSObject<DMHttpDataModel>

@property (strong, nonatomic) NSNumber *courseId;
@property (strong, nonatomic) NSString *title;

-(instancetype) initWithId: (NSInteger) courseId
                 andTitle: (NSString *) title;

-(instancetype) initWithIdNumber: (NSNumber *) courseId
                 andTitle: (NSString *) title;


+(DMCourseModel *) courseWithIdNumber: (NSNumber *) courseId
                             andTitle: (NSString *) title;

+(DMCourseModel *) courseWithId: (NSInteger) courseId
                       andTitle: (NSString *) title;

@end
