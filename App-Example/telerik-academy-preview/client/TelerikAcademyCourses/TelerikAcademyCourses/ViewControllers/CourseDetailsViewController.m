//
//  CourseDetailsViewController.m
//  TelerikAcademyCourses
//
//  Created by Doncho Minkov on 2/5/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "CourseDetailsViewController.h"

#import "AppDelegate.h"

#import "DMHttpData.h"

#import <CoreData/CoreData.h>

@interface CourseDetailsViewController ()

@property (strong, nonatomic) DMHttpData *httpData;

@property (strong, nonatomic) NSManagedObjectContext  *managedContext;

@property (weak, nonatomic) IBOutlet UILabel *labelDesc;

- (IBAction)tapAddToFavorites:(id)sender;
- (IBAction)tapRemoveFromFavorites:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnAddToFavorites;

@property (weak, nonatomic) IBOutlet UIButton *btnRemoveFromFavorites;

@end

@implementation CourseDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.courseTitle;
    
    [self loadCourseDetails];
    [self updateButtonsVisibility];
}

-(void) loadCourseDetails {
    NSString *url = [NSString stringWithFormat: @"http://localhost:9002/api/courses/%@", self.courseId];
    
    [[self data] getFrom:url headers:nil withCompletionHandler:^(NSDictionary * data, NSError * err) {
        self.courseDetails = [DMCourseDetailsModel courseDetailsWithDict: [data objectForKey:@"result"]];
        dispatch_async(dispatch_get_main_queue(), ^{
//            self.title = self.courseDetails.title;
            self.labelDesc.text = self.courseDetails.desc;
        });
    }];
}


-(void) updateButtonsVisibility {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName: @"Course"];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat: @"courseId==%@", self.courseId]];
    
    NSError *err;
    
    NSInteger matchesCount = [self.managedContext countForFetchRequest:fetchRequest error:&err];
    if(matchesCount == 0) {
        self.btnRemoveFromFavorites.hidden = YES;
    }
    else {
        self.btnAddToFavorites.hidden = YES;
    }
}


@synthesize httpData = _httpData;

-(DMHttpData *)data {
    if(_httpData == nil){
        AppDelegate *appDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
        _httpData = appDelegate.httpData;
    }
    return _httpData;
}

@synthesize managedContext = _managedContext;

-(NSManagedObjectContext *)managedContext {
    if(_managedContext == nil){
        AppDelegate *appDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
        _managedContext = appDelegate.managedObjectContext;
    }
    
    return _managedContext;
}

- (IBAction)tapAddToFavorites:(id)sender {
    
    NSEntityDescription *entity =
        [NSEntityDescription entityForName:@"Course" inManagedObjectContext:self.managedContext];
    
    NSManagedObject *newCourse = [[NSManagedObject alloc] initWithEntity: entity insertIntoManagedObjectContext: self.managedContext];
    
    [newCourse setValue: self.courseId forKey:@"courseId"];
    [newCourse setValue: self.courseTitle forKey:@"title"];
    
    NSError *err;
    [self.managedContext save:&err];
    
    if(err == nil) {
        NSLog(@"%@ saved to favorites!", self.courseTitle);
    }
    else {
        NSLog(@"Bad things happen");
    }
    self.btnAddToFavorites.hidden = YES;
    self.btnRemoveFromFavorites.hidden = NO;
}

- (IBAction)tapRemoveFromFavorites:(id)sender {
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName: @"Course"];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat: @"courseId==%@", self.courseId]];
    
    NSError *err;
    
    NSArray *results = [self.managedContext executeFetchRequest:fetchRequest error:&err];
    
    NSManagedObject *courseToRemove = [results firstObject];
    
    [self.managedContext deleteObject:courseToRemove];
    
    [self.managedContext save:&err];
    
    self.btnRemoveFromFavorites.hidden = YES;
    self.btnAddToFavorites.hidden = NO;
}
@end
