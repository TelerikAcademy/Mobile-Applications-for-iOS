//
//  MainViewController.h
//  iOSArchitectureDemos
//
//  Created by Doncho Minkov on 10/27/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITableViewDataSource>
- (IBAction)buttonTap:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
