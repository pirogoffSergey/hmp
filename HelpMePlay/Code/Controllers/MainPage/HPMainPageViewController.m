//
//  HPMainPageViewController.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 31.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPMainPageViewController.h"
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
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[HPLoginViewController new]];
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
