//
//  CoursesTableViewController.m
//  TelerikAcademyCourses
//
//  Created by Doncho Minkov on 2/4/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "DMCoursesViewController.h"

#import "AppDelegate.h"

#import "DMHttpData.h"

#import "DMCourseModel.h"

#import "DMCourseDetailsViewController.h"

@interface DMCoursesViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)tapShowMore:(id)sender;

@property (strong, nonatomic) NSMutableArray *courses;

@property (strong, nonatomic) NSString *url;

@property (strong, nonatomic) DMHttpData *data;

@end

@implementation DMCoursesViewController
{
    UIActivityIndicatorView *_activityIndicator;
    NSInteger _currentPage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.labelTitle.text = @"All Courses";
    
    UIImage *bgImage = [UIImage imageNamed: @"TelerikAcademyHeader"];
    [self.navigationController.navigationBar setBackgroundImage: bgImage forBarMetrics:UIBarMetricsDefault];
    
    
    [self.tableView registerClass: UITableViewCell.self forCellReuseIdentifier:@"Cell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:self.view.bounds];
    
    _activityIndicator.color = [UIColor blueColor];
    [_activityIndicator startAnimating];
    
    [self.view addSubview: _activityIndicator];
    
    self.courses = [NSMutableArray array];
    _currentPage = 1;
    [self loadNextPageOfCourses];
}

-(void) loadNextPageOfCourses {
    NSString *url = [NSString stringWithFormat: @"%@?page=%ld", self.url, _currentPage];
    NSDictionary *headers = @{
                              @"content-type": @"application/json"
                              };
    
    [self.data getFrom: url
           withHeaders: headers
 withCompletionHandler: ^(NSDictionary * result, NSError * err) {
        NSArray *coursesDicts = [result objectForKey:@"result"];
        
        NSMutableArray *courses = [NSMutableArray array];
        [coursesDicts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [courses addObject:[[DMCourseModel alloc] initWithDict: obj]];
        }];
        
        [self.courses addObjectsFromArray:courses];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [_activityIndicator stopAnimating];
        });
    }];
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
    
    DMCourseDetailsViewController *courseDetailsVC = [self.storyboard instantiateViewControllerWithIdentifier: @"CourseDetailsScene"];
    
    courseDetailsVC.courseId = [self.courses[indexPath.row] courseId];
    courseDetailsVC.courseTitle = [self.courses[indexPath.row] title];
    
    [self.navigationController pushViewController:courseDetailsVC
                                         animated:YES];
}

-(DMHttpData *)data {
    AppDelegate *appDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
    return appDelegate.httpData;
}

@synthesize url = _url;

-(NSString *) url {
    if(_url == nil){
        AppDelegate *delegate = [UIApplication sharedApplication].delegate;
        
        _url = [NSString stringWithFormat:@"%@/courses", delegate.baseUrl];
    }
    return _url;
}

- (IBAction)tapShowMore:(id)sender {
    ++_currentPage;
    [self loadNextPageOfCourses];
}
@end
