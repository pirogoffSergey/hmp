//
//  HPToLoginTransaction.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 23.10.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPToLoginTransaction.h"
#import "HPSettingsViewController.h"
#import "HPLoginViewController.h"


@implementation HPToLoginTransaction

- (void)execute
{
    NSParameterAssert(self.parentController);
    
    UIViewController *controllerToPush = nil;
    User *user = [HPDatabase currentUser];
    controllerToPush = (user && [user isLogged]) ? [HPSettingsViewController new] : [HPLoginViewController new];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controllerToPush];
    [self.parentController presentViewController:nav animated:YES completion:nil];
}

@end
