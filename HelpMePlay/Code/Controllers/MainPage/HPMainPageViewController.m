//
//  HPMainPageViewController.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 31.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPMainPageViewController.h"
#import "HPSettingsViewController.h"
#import "HPLoginViewController.h"


@interface HPMainPageViewController ()

@end


@implementation HPMainPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupSettingsButton];
}

- (NSString *)title
{
    return @"Help Me Play";
}


#pragma mark -
#pragma mark Setupers

- (void)setupSettingsButton
{
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize
                                                                                    target:self
                                                                                    action:@selector(settingsPressed:)];
    self.navigationItem.leftBarButtonItems = @[settingsButton];
}


#pragma mark -
#pragma mark Actions

-(void)settingsPressed:(id)sender
{
    UIViewController *controllerToPush = nil;
    
    User *user = [HPDatabase currentUser];
    controllerToPush = (user && [user isLogged]) ? [HPSettingsViewController new] : [HPLoginViewController new];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controllerToPush];
    [self presentViewController:nav animated:YES completion:nil];
}

- (IBAction)authorsTapped:(id)sender
{
    
}

- (IBAction)playlistsTapped:(id)sender
{
    
}

- (IBAction)genresTapped:(id)sender
{
    
}

- (IBAction)allSongsTapped:(id)sender
{
    
}

@end
