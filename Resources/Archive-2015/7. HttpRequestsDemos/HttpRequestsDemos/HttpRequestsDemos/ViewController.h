//
//  ViewController.h
//  HttpRequestsDemos
//
//  Created by Doncho Minkov on 10/30/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)buttonLoadStudents:(id)sender;
- (IBAction)buttonSendData:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *labelStudentsList;
@end

