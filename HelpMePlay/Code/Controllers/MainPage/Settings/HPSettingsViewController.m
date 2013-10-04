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
#import "HPNavBarElementsProducer.h"


@interface HPSettingsViewController ()

@end


@implementation HPSettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupCloseButton];
}


#pragma mark -
#pragma mark Setupers

- (void)setupCloseButton
{
    self.navigationItem.leftBarButtonItem = [HPNavBarElementsProducer closeButtonWithTarget:self action:@selector(closeButtonPressed:)];
}


#pragma mark -
#pragma mark Actions

- (IBAction)logoutPressed:(id)sender
{
    [[HPRequestFactory sharedInstance] logout];
    [self closeButtonPressed:nil];
}

- (IBAction)userInfoPressed:(id)sender
{
    HPSignupViewController *userInfoController = [[HPSignupViewController alloc] initUserInfoControllerWithUser:[HPDatabase currentUser]];
    [self.navigationController pushViewController:userInfoController animated:YES];
}

- (void)closeButtonPressed:(id)sender
{
    [self.navigationController dismissModalViewControllerAnimated:YES];
}

@end
