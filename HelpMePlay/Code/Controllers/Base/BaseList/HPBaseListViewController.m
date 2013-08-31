//
//  HPBaseListViewController.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 31.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPBaseListViewController.h"

@interface HPBaseListViewController () <VTDataSourceDelegate>
@end


@implementation HPBaseListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupDataSource];
}


#pragma mark -
#pragma mark Setupers

- (void)setupTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.tableView];
}

- (void)setupDataSource
{
    self.dataSource = [HPBaseDataSource new];
    self.dataSource.tableView = self.tableView;
    self.dataSource.delegate = self;
}

#pragma mark -
#pragma mark 

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath withItem:(id)item
{
    NSLog(@"selected item = %@", item);
}

@end
