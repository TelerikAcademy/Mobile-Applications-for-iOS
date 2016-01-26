//
//  ViewController.m
//  CustomViews
//
//  Created by Doncho Minkov on 10/29/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import "ViewController.h"
#import "DetailsUIView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DetailsUIView* detailsUiView = [[[NSBundle mainBundle] loadNibNamed:@"DetailsView"
                                                                  owner:self
                                                                options:nil]
                                    objectAtIndex:0];
    
    [self.view addSubview:detailsUiView];
    
    [detailsUiView.buttonSave addTarget:self
                                 action: @selector(detailsViewButtonTap)
                       forControlEvents:UIControlEventTouchUpInside];
//    [detailsUiView.buttonSave addTarget:self
//                                 action:@selector(detailsViewButtonTap2)
//                       forControlEvents:UIControlEventTouchUpInside];
}

-(void) detailsViewButtonTap{
    NSLog(@"From");
    
}

-(void) detailsViewButtonTap2{
    NSLog(@"From 2");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
