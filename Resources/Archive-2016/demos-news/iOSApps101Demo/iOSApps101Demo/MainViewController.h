//
//  ViewController.h
//  iOSApps101Demo
//
//  Created by Doncho Minkov on 1/22/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *header;

@end

