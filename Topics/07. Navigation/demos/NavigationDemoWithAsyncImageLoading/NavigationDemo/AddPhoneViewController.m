//
//  AddPhoneViewController.m
//  NavigationDemo
//
//  Created by Doncho Minkov on 1/28/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "AddPhoneViewController.h"

#import "AppDelegate.h"

#import "DMPhone.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface AddPhoneViewController ()
@property (weak, nonatomic) IBOutlet UITextField *vendorField;
@property (weak, nonatomic) IBOutlet UITextField *modelField;
@property (weak, nonatomic) IBOutlet UITextField *priceField;
@property (weak, nonatomic) IBOutlet UITextField *imageField;
- (IBAction)tapSave:(id)sender;
- (IBAction)imageFieldChanged:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imagePreview;

@end

@implementation AddPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imagePreview.image = [UIImage imageNamed:@"Batman"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapSave:(id)sender {
    DMPhone *phone = [DMPhone phoneWithVendor:self.vendorField.text
                                        model:self.modelField.text
                                     imageUrl:self.imageField.text
                                     andPrice:[self.priceField.text floatValue]];
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    [delegate.data addPhone:phone];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)imageFieldChanged:(id)sender {
    NSURL *url = [NSURL URLWithString:self.imageField.text];

    [self.imagePreview sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"Batman"]];
    
//    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
//    if(image == nil){
//        return;
//    }
//    
//    self.imagePreview.image = image;
}

@end
