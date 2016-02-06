//
//  FavoriteCoursesTableViewController.m
//  TelerikAcademyCourses
//
//  Created by Doncho Minkov on 2/5/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "DMFavoriteCoursesViewController.h"
#import "AppDelegate.h"

#import <CoreData/CoreData.h>

#import "DMCourseModel.h"

#import "DMCourseDetailsViewController.h"

@interface DMFavoriteCoursesViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSManagedObjectContext *managedContext;

@property (strong, nonatomic) NSArray *courses;

@end

@implementation DMFavoriteCoursesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.labelTitle.text = @"My favorite courses!";
    
    UIImage *bgImage = [UIImage imageNamed: @"TelerikAcademyHeader"];
    [self.navigationController.navigationBar setBackgroundImage: bgImage forBarMetrics:UIBarMetricsDefault];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:UITableViewCell.self forCellReuseIdentifier: @"FavoriteCourseCell"];
}

-(void)viewWillAppear:(BOOL)animated {
    self.courses = [self loadCourses];
    [self.tableView reloadData];
}

-(NSArray *) loadCourses {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Course"];
    
    NSError *error;
    
    NSArray *coursesEntities = [self.managedContext executeFetchRequest:fetchRequest
                                                                  error:&error];
    
    NSMutableArray *courses = [NSMutableArray array];
    for(int i = 0; i < coursesEntities.count; i ++) {
        NSManagedObject *courseEntity = coursesEntities[i];
        DMCourseModel *course = [DMCourseModel courseWithId:[courseEntity valueForKey:@"courseId"]
                                                         andTitle:[courseEntity valueForKey:@"title"]];
        [courses addObject: course];
    }
    return courses;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.courses.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FavoriteCourseCell" forIndexPath:indexPath];
    
    DMCourseModel *course = self.courses[indexPath.row];
    
    cell.textLabel.text = course.title;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath  {
    
    DMCourseDetailsViewController *courseDetailsVC = [self.storyboard instantiateViewControllerWithIdentifier: @"CourseDetailsScene"];
    
    courseDetailsVC.courseId = [self.courses[indexPath.row] courseId];
    courseDetailsVC.courseTitle = [self.courses[indexPath.row] title];
    
    [self.navigationController pushViewController:courseDetailsVC
                                         animated:YES];
}

@synthesize managedContext = _managedContext;

-(NSManagedObjectContext *)managedContext {
    if(_managedContext == nil){
        AppDelegate *appDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
        _managedContext = appDelegate.managedObjectContext;
    }
    
    return _managedContext;
}

@end
