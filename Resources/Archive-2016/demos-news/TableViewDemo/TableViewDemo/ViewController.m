//
//  ViewController.m
//  TableViewDemo
//
//  Created by Doncho Minkov on 1/22/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSMutableArray *dates;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dates = [NSMutableArray arrayWithObjects: @"First", @"Second", nil];
    self.tableViewDates.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dates.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{

//    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    static NSString *cellIdentifier = @"DateTableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat: @"%@", self.dates[indexPath.row]];
    
    return cell;
}


- (IBAction)tapAddDate:(id)sender {
    NSDate *now = [[NSDate alloc] init];
    [self.dates addObject: [NSString stringWithFormat:@"%@", now]];
    [self.tableViewDates reloadData];
    
}
@end
