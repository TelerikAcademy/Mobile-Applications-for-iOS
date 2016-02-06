//
//  CourseDetailsViewController.h
//  TelerikAcademyCourses
//
//  Created by Doncho Minkov on 2/5/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DMCourseDetailsModel.h"

@interface DMCourseDetailsViewController : UIViewController

@property (strong, nonatomic) NSString *courseId;
@property (strong, nonatomic) NSString *courseTitle;
@property (strong, nonatomic) DMCourseDetailsModel *courseDetails;


@end
