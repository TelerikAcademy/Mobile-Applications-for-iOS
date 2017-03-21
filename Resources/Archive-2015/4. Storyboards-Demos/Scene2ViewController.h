//
//  Scene2ViewController.h
//  StoryboardsDemos
//
//  Created by Doncho Minkov on 10/28/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Scene2ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelData;

@property NSDate *date;
@property (nonatomic, strong) NSString* text;

@property (nonatomic, strong) NSMutableArray* numbers;

@end
