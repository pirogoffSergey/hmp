//
//  HPSimpleDataSource.h
//  HelpMePlay
//
//  Created by Sergey Pirogov on 22.09.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPBaseDataSource.h"

@interface HPSimpleDataSource : HPBaseDataSource

@property (nonatomic, strong) NSArray *records;
@property (nonatomic, assign) UITableViewCellSelectionStyle cellSelectionStyle;
@property (nonatomic, copy) NSArray * (^reloadBlock)();

@end
