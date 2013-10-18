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
#import "HPNavBarElementsProducer.h"
#import "HPBaseListViewController.h"
#import "HPSimpleDataSource.h"

#import "HPAuthorViewController.h"
#import "HPAddSongViewController.h"
#import "HPGenreAddViewController.h"
#import "HPGenreListViewController.h"


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
    UIViewController *controllerToPush = nil;
    
    User *user = [HPDatabase currentUser];
    controllerToPush = (user && [user isLogged]) ? [HPSettingsViewController new] : [HPLoginViewController new];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controllerToPush];
    [self presentViewController:nav animated:YES completion:nil];
}


- (IBAction)authorsTapped:(id)sender
{
    [self.navigationController pushViewController:[self authorsList] animated:YES];
}

- (IBAction)playlistsTapped:(id)sender
{
    
}

- (IBAction)genresTapped:(id)sender
{
    [self.navigationController pushViewController:[self genresList] animated:YES];
}

- (IBAction)allSongsTapped:(id)sender
{
    HPBaseListViewController *list = [HPBaseListViewController new];
    list.addActionBlock = ^(UIViewController *controller){
        [controller.navigationController pushViewController:[HPAddSongViewController new] animated:YES];
    };
    [self.navigationController pushViewController:list animated:YES];
}


#pragma mark -
#pragma mark Helpers

- (HPBaseListViewController *)authorsList
{
    HPBaseListViewController *list = [HPBaseListViewController new];
    list.title = @"authors";
    HPSimpleDataSource *dataSource = [HPSimpleDataSource new];
    dataSource.reloadBlock = ^{
        return [HPDatabase allAuthors];
    };
    list.dataSource = dataSource;
    
    list.addActionBlock = ^(UIViewController *controller){
        [controller.navigationController pushViewController:[HPAuthorViewController new] animated:YES];
    };
    return list;
}

- (HPBaseListViewController *)genresList
{
    HPGenreListViewController *list = [HPGenreListViewController new];
    HPSimpleDataSource *dataSource = [HPSimpleDataSource new];
    dataSource.reloadBlock = ^{
        return [HPDatabase allGenres];
    };
    list.dataSource = dataSource;
    return list;
}

@end



