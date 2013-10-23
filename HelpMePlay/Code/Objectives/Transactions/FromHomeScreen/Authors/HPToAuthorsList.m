//
//  HPToAuthorsList.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 23.10.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPToAuthorsList.h"
#import "HPBaseListViewController.h"
#import "HPSimpleDataSource.h"
#import "HPAuthorViewController.h"


@implementation HPToAuthorsList

- (void)execute
{
    NSParameterAssert(self.navigationController);
    
    UIViewController *vc = [self createAuthorsList];
    [self.navigationController pushViewController:vc animated:YES];
}


- (HPBaseListViewController *)createAuthorsList
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


@end
