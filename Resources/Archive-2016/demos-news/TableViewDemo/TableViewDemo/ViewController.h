//
//  ViewController.h
//  TableViewDemo
//
//  Created by Doncho Minkov on 1/22/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
- (IBAction)tapAddDate:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableViewDates;

@end

