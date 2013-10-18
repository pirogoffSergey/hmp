//
//  HPBaseListViewController.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 31.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPBaseListViewController.h"
#import "HPNavBarElementsProducer.h"


@interface HPBaseListViewController () <VTDataSourceDelegate>
@end


@implementation HPBaseListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupAppearance];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.dataSource reload];
}


#pragma mark -
#pragma mark Setupers

- (void)setupAppearance
{
    [self setupTableView];
    [self setupDataSource];
    [self setupAddButton];
    self.view.backgroundColor = [UIColor colorWithRed:55/255.0 green:204/255.0 blue:143/255.0 alpha:1];
}

- (void)setupTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
}

- (void)setupDataSource
{
//    self.dataSource = [HPBaseDataSource new];
    self.dataSource.tableView = self.tableView;
    self.dataSource.delegate = self;
}

- (void)setupAddButton
{
    self.navigationItem.rightBarButtonItem = [HPNavBarElementsProducer addButtonWithTarget:self action:@selector(addButtonPressed:)];
}


#pragma mark -
#pragma mark Selection

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath withItem:(id)item
{
    NSLog(@"selected item = %@", item);
}

- (void)addButtonPressed:(id)target
{
    if(self.addActionBlock) {
        self.addActionBlock(self);
    }
}

@end
