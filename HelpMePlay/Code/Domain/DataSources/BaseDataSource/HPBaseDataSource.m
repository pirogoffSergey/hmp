//
//  HPBaseDataSource.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 31.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPBaseDataSource.h"

@implementation HPBaseDataSource

- (void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    _tableView.dataSource = self;
    _tableView.delegate = self;
}

- (Class)classForCellAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell class];
}

- (NSString *)cellReuseIdentefireAtIndexPath:(NSIndexPath *)indexPath
{
    return @"cellReuseIdentefire";
}

- (NSUInteger)numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (NSUInteger)numberOfSections
{
    return 1;
}

- (void)fillCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSAssert(nil, @"need to implement");
}

- (void)setupCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{}

- (void)didSelectedRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSAssert(nil, @"need to implement");
}

- (void)reload
{
    [self.tableView reloadData];
}


#pragma mark -
#pragma mark UITableViewDataSource

- (UITableViewCellStyle)cellsStyle
{
    return UITableViewCellStyleDefault;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellReuseIdentefire = [self cellReuseIdentefireAtIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentefire];
    if (!cell) {
        cell = [[[self classForCellAtIndexPath:indexPath] alloc] initWithStyle:[self cellsStyle]
                                                               reuseIdentifier:cellReuseIdentefire];
        [self setupCell:cell atIndexPath:indexPath];
    }
    
    [self fillCell:cell atIndexPath:indexPath];
    
    return cell;
}


#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self didSelectedRowAtIndexPath:indexPath];
}

@end
