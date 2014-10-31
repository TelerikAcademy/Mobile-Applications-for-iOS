//
//  AppDelegate.h
//  AppLifecycleDemos
//
//  Created by Doncho Minkov on 10/30/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

                            //Everlive
@property (strong, nonatomic) NSObject* everlive;

@property (strong, nonatomic) NSArray* names;


@end

