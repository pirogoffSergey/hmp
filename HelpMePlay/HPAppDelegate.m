//
//  HPAppDelegate.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 24.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPAppDelegate.h"
#import "HPRequestFactory.h"
#import "HPMainPageViewController.h"


@implementation HPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [self createFirstController];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (UINavigationController *)createFirstController
{
    return [[UINavigationController alloc] initWithRootViewController:[HPMainPageViewController new]];
}

@end
