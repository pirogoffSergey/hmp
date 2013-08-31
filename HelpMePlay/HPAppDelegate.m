//
//  HPAppDelegate.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 24.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPAppDelegate.h"
#import "HPRequestFactory.h"
//#import "HPLoginViewController.h"
#import "HPSignupViewController.h"

@implementation HPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.window.rootViewController = [HPSignupViewController new];
    
//    HPRequest *req = [[HPRequestFactory sharedInstance] createUserWithName:@"nameox" login:@"vasya" password:@"qwerty"];
//    HPRequest *req = [[HPRequestFactory sharedInstance] sendPic];
//    [req start];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
