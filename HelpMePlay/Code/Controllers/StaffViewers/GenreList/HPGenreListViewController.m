//
//  HPGenreListViewController.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 18.10.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPGenreListViewController.h"
#import "HPAddGenreView.h"


@interface HPGenreListViewController ()

@property (nonatomic, strong) HPAddGenreView *addGenreView;

@end


@implementation HPGenreListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
}


- (void)setup
{
    [self setupGenreAddView];
}

- (void)setupGenreAddView
{
    self.addGenreView = [HPAddGenreView createView];
    [self.addGenreView hide];
    [self.view addSubview:self.addGenreView];
}




#pragma mark -
#pragma mark Actions

- (void)addButtonPressed:(UIBarButtonItem *)sender
{
    RESIGN_ALL;
    
    if (!self.addGenreView.isVisible) {
        UIEdgeInsets contentInset = self.tableView.contentInset;
        contentInset.top = self.addGenreView.bounds.size.height;

        [self.addGenreView showWithAnimationBlock:^{
            self.tableView.contentInset = contentInset;
        }];

    } else {
        [((UILabel *)self.navigationItem.titleView) setText:self.title];
        UIEdgeInsets contentInset = self.tableView.contentInset;
        contentInset.top = 0;

        [self.addGenreView hideWithAnimationBlock:^{
            self.tableView.contentInset = contentInset;
        }];
    }

    
}




- (void)pressedAdd
{
    //    [sender setSelected:!sender.isSelected];
    //    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    
    //    if (!self.searchView.isVisible) {
    //        [((UILabel *)self.navigationItem.titleView) setText:@"Search"];
    //        UIEdgeInsets contentInset = self.tableView.contentInset;
    //        contentInset.top = self.searchView.frame.size.height;
    //
    //        [self.searchView show:^{
    //            self.tableView.contentInset = contentInset;
    //        }];
    //
    //    } else {
    //        [((UILabel *)self.navigationItem.titleView) setText:self.title];
    //        UIEdgeInsets contentInset = self.tableView.contentInset;
    //        contentInset.top = 0;
    //
    //        [self setTableViewContentInset:contentInset];
    //        [self.searchView hide];
    //    }
    
}


@end
