//
//  AppDelegate.m
//  NavigationDemo
//
//  Created by Doncho Minkov on 1/28/16.
//  Copyright © 2016 Doncho Minkov. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.data = [[LocalData alloc] init];
    
    NSArray *phones = [NSArray arrayWithObjects:
                       
                       [DMPhone phoneWithVendor:@"Nokia" model:@"3310" imageUrl:@"http://images.linnlive.com/f1bbf957489c6d33f6afd214b78aca08/9020f717-04a6-434c-b49f-d7e06d136353.jpg" andPrice:100],
                       
                       [DMPhone phoneWithVendor:@"Apple" model:@"iPhone 5S" imageUrl:@"http://www.imore.com/sites/imore.com/files/styles/large/public/field/image/2014/03/topic_iphone_5s.png?itok=A24vBPpa" andPrice:1500],
                       
                       [DMPhone phoneWithVendor:@"Microsoft" model:@"Lumia 610" imageUrl:@"http://cdn2.pcadvisor.co.uk/cmsdata/reviews/3341772/Nokia_Lumia_610_1-1.jpg" andPrice:300],
                       
                       [DMPhone phoneWithVendor:@"Samsung" model:@"Galaxy S6" imageUrl:@"http://www.samsung.com/in/consumer-images/product/mobile-phone/2015/SM-G920IZDAINS/features/SM-G920IZDAINS-403979-2.jpg" andPrice:1200],
                       
                       nil];
    
    [phones enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.data addPhone:obj];
    }];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
