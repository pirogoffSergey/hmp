//
//  HPToGenresList.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 23.10.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPToGenresList.h"
#import "HPGenreListViewController.h"
#import "HPSimpleDataSource.h"


@implementation HPToGenresList

- (void)execute
{
    NSParameterAssert(self.navigationController);
    
    HPGenreListViewController *vc = [self createGenresList];
    [self.navigationController pushViewController:vc animated:YES];
}


- (HPGenreListViewController *)createGenresList
{
    HPGenreListViewController *list = [HPGenreListViewController new];
    HPSimpleDataSource *dataSource = [HPSimpleDataSource new];
    dataSource.cellSelectionStyle = UITableViewCellSelectionStyleNone;
    dataSource.reloadBlock = ^{
        return [HPDatabase allGenres];
    };
    list.dataSource = dataSource;
    return list;
}

@end



