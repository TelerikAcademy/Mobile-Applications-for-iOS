//
//  DetailsViewController.h
//  HTTPRequests
//
//  Created by Doncho Minkov on 1/27/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMSuperhero.h"

@interface DetailsViewController : UIViewController

@property (strong, nonatomic) DMSuperhero *superhero;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
