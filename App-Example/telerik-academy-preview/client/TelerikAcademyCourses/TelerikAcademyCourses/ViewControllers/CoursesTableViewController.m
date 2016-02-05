//
//  CoursesTableViewController.m
//  TelerikAcademyCourses
//
//  Created by Doncho Minkov on 2/4/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "CoursesTableViewController.h"

#import "AppDelegate.h"

#import "DMHttpData.h"

#import "DMCourseModel.h"

#import "CourseDetailsViewController.h"

@interface CoursesTableViewController ()

@property (strong, nonatomic) NSArray *courses;
@property (strong, nonatomic) DMHttpData *data;

@end

@implementation CoursesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title  = @"Courses!";
    
    [self.tableView registerClass: UITableViewCell.self forCellReuseIdentifier:@"Cell"];
    
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:self.view.bounds];
    
    activityIndicator.color = [UIColor blueColor];
    [activityIndicator startAnimating];
    
    [self.view addSubview:activityIndicator];
    
    NSString *url = @"http://localhost:9002/api/courses";
    
    [self.data getFrom:url headers:nil withCompletionHandler: ^(NSDictionary * result, NSError * err) {
        NSArray *coursesDicts = [result objectForKey:@"result"];
        
        NSMutableArray *courses = [NSMutableArray array];
        [coursesDicts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [courses addObject:[[DMCourseModel alloc] initWithDict: obj]];
        }];
        
        self.courses = courses;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [activityIndicator stopAnimating];
        });
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.courses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.courses[indexPath.row] title];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath  {
    
    CourseDetailsViewController *courseDetailsVC = [self.storyboard instantiateViewControllerWithIdentifier: @"CourseDetailsScene"];
    
    courseDetailsVC.courseId = [self.courses[indexPath.row] courseId];
    courseDetailsVC.courseTitle = [self.courses[indexPath.row] title];
    
    [self.navigationController pushViewController:courseDetailsVC
                                         animated:YES];
}

-(DMHttpData *)data {
    AppDelegate *appDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
    return appDelegate.httpData;
}

@end
