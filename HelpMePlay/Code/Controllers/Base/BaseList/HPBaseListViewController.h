//
//  HPBaseListViewController.h
//  HelpMePlay
//
//  Created by Sergey Pirogov on 31.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPBaseViewController.h"
#import "HPBaseDataSource.h"

@interface HPBaseListViewController : HPBaseViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HPBaseDataSource *dataSource;

@end
