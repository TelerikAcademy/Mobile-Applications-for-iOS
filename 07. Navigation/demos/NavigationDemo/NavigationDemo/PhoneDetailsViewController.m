//
//  PhoneDetailsViewController.m
//  NavigationDemo
//
//  Created by Doncho Minkov on 1/28/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "PhoneDetailsViewController.h"

@interface PhoneDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *modelLabel;
@property (weak, nonatomic) IBOutlet UILabel *venderLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation PhoneDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"%@ %@", self.phone.vendor, self.phone.model];
    
    self.venderLabel.text = self.phone.vendor;
    self.modelLabel.text = self.phone.model;
    self.priceLabel.text = [NSString stringWithFormat:@"Price: %.2f", self.phone.price];
    self.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.phone.imageUrl]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
