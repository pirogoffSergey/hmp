//
//  HPSimpleDataSource.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 22.09.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPSimpleDataSource.h"

@implementation HPSimpleDataSource

- (id)init
{
    self = [super init];
    if (self) {
        self.cellSelectionStyle = UITableViewCellSelectionStyleBlue;
    }
    return self;
}

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
    cell.selectionStyle = self.cellSelectionStyle;
}

- (void)reload
{
    if(self.reloadBlock) {
        self.records = self.reloadBlock();
    }
    [super reload];
}


- (void)didSelectedRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.delegate) {
        [self.delegate didSelectRowAtIndexPath:indexPath withItem:self.records[indexPath.row]];
    }
}



#pragma mark -
#pragma mark Right Letters Support

//- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
//{
//    return index;
//}
//
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    NSMutableArray *letters = [NSMutableArray array];
//    NSArray *keys = @[@"a", @"b", @"c", @"f",];
//    
//    for(NSString *s in keys) {
//        [letters addObject:s.uppercaseString];
//    }
//    return letters;
//}


@end
