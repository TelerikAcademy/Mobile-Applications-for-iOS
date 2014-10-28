//
//  LinkControlsViewController.h
//  iOSArchitectureDemos
//
//  Created by Doncho Minkov on 10/27/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LinkControlsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;
- (IBAction)buttonTap:(id)sender;

@end
