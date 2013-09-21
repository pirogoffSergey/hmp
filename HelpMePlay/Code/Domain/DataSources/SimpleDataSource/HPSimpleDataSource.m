//
//  HPSimpleDataSource.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 22.09.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPSimpleDataSource.h"

@implementation HPSimpleDataSource

- (NSUInteger)numberOfRowsInSection:(NSInteger)section
{
    return (self.records) ? self.records.count : 0;
}

- (void)fillCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSString *text = @"no_text";
    id record = self.records[indexPath.row];
    
    if([record isKindOfClass:[NSString class]]) {
        text = record;
    }
    else if ([record respondsToSelector:@selector(title)]) {
        text = [record performSelector:@selector(title) withObject:nil];
    }
    else if ([record respondsToSelector:@selector(name)]) {
        text = [record performSelector:@selector(name) withObject:nil];
    }
    cell.textLabel.text = text;
}

- (void)reload
{
    if(self.reloadBlock) {
        self.records = self.reloadBlock();
    }
    [super reload];
}

@end
