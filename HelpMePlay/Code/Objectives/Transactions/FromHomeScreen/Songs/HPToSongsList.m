//
//  HPToSongsList.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 23.10.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPToSongsList.h"
#import "HPBaseListViewController.h"
#import "HPSimpleDataSource.h"
#import "HPAddSongViewController.h"


@implementation HPToSongsList

- (void)execute
{
    NSParameterAssert(self.navigationController);
    
    UIViewController *vc = [self createSongsList];
    [self.navigationController pushViewController:vc animated:YES];
}


- (HPBaseListViewController *)createSongsList
{
    HPBaseListViewController *list = [HPBaseListViewController new];
    HPSimpleDataSource *dataSource = [HPSimpleDataSource new];
    dataSource.reloadBlock = ^{
        return [HPDatabase allSongs];
    };
    list.dataSource = dataSource;
    
    list.addActionBlock = ^(UIViewController *controller){
        [controller.navigationController pushViewController:[HPAddSongViewController new] animated:YES];
    };
    return list;
}

@end
