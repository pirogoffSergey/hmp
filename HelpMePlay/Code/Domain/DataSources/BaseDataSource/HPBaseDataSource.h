//
//  HPBaseDataSource.h
//  HelpMePlay
//
//  Created by Sergey Pirogov on 31.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VTDataSourceDelegate <NSObject>
@optional
- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath withItem:(id)item;
@end


@interface HPBaseDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) id<VTDataSourceDelegate> delegate;

- (NSUInteger)numberOfSections;
- (NSUInteger)numberOfRowsInSection:(NSInteger)section;
- (NSString *)cellReuseIdentefireAtIndexPath:(NSIndexPath *)indexPath;
- (Class)classForCellAtIndexPath:(NSIndexPath *)indexPath;

- (void)fillCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
- (void)setupCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
- (void)didSelectedRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)reload;

@end
