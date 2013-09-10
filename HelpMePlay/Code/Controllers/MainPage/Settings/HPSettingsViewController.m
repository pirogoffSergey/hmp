//
//  HPSettingsViewController.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 09.09.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPSettingsViewController.h"
#import "HPRequestFactory.h"
#import "HPSignupViewController.h"


@interface HPSettingsViewController ()

@end


@implementation HPSettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}


#pragma mark -
#pragma mark Actions

- (IBAction)logoutPressed:(id)sender
{
    [[HPRequestFactory sharedInstance] logout];
    [self closeController];
}

- (IBAction)userInfoPressed:(id)sender
{
    HPSignupViewController *userInfoController = [[HPSignupViewController alloc] initUserInfoControllerWithUser:[HPDatabase currentUser]];
    [self.navigationController pushViewController:userInfoController animated:YES];
}

- (void)closeController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
