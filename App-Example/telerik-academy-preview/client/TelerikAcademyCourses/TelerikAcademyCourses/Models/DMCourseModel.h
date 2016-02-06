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

@property (strong, nonatomic) NSString *courseId;
@property (strong, nonatomic) NSString *title;

-(instancetype) initWithId: (NSString *) courseId
                 andTitle: (NSString *) title;

+(DMCourseModel *) courseWithId: (NSString *) courseId
                             andTitle: (NSString *) title;

@end
