//
//  ViewController.m
//  iOSApps101Demo
//
//  Created by Doncho Minkov on 1/22/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UITableView *datesViews;
@property NSMutableArray *dates;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datesViews.dataSource = self;
    self.dates = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateDateTouch:(id)sender {
    NSDate *date = [[NSDate alloc] init];
    [self.dates addObject:date];
    [self.datesViews reloadData];
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [self.datesViews dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.dates[indexPath.row]];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dates.count;
}
@end
