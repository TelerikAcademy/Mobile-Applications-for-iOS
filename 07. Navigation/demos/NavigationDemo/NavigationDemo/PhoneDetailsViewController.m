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
    
    self.venderLabel.text = [NSString stringWithFormat: @"by %@", self.phone.vendor];
    self.modelLabel.text = self.phone.model;
    
    NSString *formattedPrice = [self formatPrice: [NSNumber numberWithFloat: self.phone.price]];
    
    self.priceLabel.text = [NSString stringWithFormat:@"Price: %@", formattedPrice];
    self.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.phone.imageUrl]]];
}

-(NSString* ) formatPrice: (NSNumber*) price {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSString *formattedPrice = [numberFormatter stringFromNumber: [NSNumber numberWithFloat:self.phone.price]];
    return formattedPrice;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
