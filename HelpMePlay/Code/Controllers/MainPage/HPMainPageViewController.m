//
//  HPMainPageViewController.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 31.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPMainPageViewController.h"
#import "HPAuthorViewController.h"
#import "HPAddSongViewController.h"
#import "HPBaseListViewController.h"
#import "HPGenreListViewController.h"
#import "HPNavBarElementsProducer.h"
#import "HPSimpleDataSource.h"

#import "HPToLoginTransaction.h"
#import "HPToAuthorsList.h"
#import "HPToGenresList.h"
#import "HPToSongsList.h"


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
    self.navigationItem.leftBarButtonItem = [HPNavBarElementsProducer settingsButtonWithTarget:self action:@selector(settingsPressed:)];
}


#pragma mark -
#pragma mark Actions

-(void)settingsPressed:(id)sender
{
    HPToLoginTransaction *transaction = [HPToLoginTransaction new];
    transaction.parentController = self;
    [transaction execute];
}


- (IBAction)authorsTapped:(id)sender
{
    HPToAuthorsList *transaction = [HPToAuthorsList new];
    transaction.navigationController = self.navigationController;
    [transaction execute];
}

- (IBAction)playlistsTapped:(id)sender
{
    
}

- (IBAction)genresTapped:(id)sender
{
    HPToGenresList *transaction = [HPToGenresList new];
    transaction.navigationController = self.navigationController;
    [transaction execute];
}

- (IBAction)allSongsTapped:(id)sender
{
    HPToSongsList *transaction = [HPToSongsList new];
    transaction.navigationController = self.navigationController;
    [transaction execute];
}


#pragma mark -
#pragma mark Helpers

@end



