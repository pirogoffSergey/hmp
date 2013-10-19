//
//  HPGenreListViewController.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 18.10.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPGenreListViewController.h"
#import "HPAddGenreView.h"

#import "Genre.h"
#import "HPEntityCreator.h"


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
    
    __weak HPGenreListViewController *weakSelf = self;
    self.addGenreView.addActionBlock = ^(NSString *nameString) {
        
        if(!nameString || [nameString isEmpty]) {
            [HPAlert showErroMessage:@"Please, input name of genre"];
            return;
        }
        if([weakSelf isAlreadyHaveGenreWithName:nameString]) {
            [HPAlert showErroMessage:@"Genre \"%@\" is already exists", nameString];
            return;
        }
        
        [weakSelf createNewGenreWithName:nameString];
        [HPAlert showSuccesMessage:@"Done"];
        [weakSelf.dataSource reload];
        RESIGN_ALL;
    };
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
        UIEdgeInsets contentInset = self.tableView.contentInset;
        contentInset.top = 0;

        [self.addGenreView hideWithAnimationBlock:^{
            self.tableView.contentInset = contentInset;
        }];
    }
}



#pragma mark -
#pragma mark Helpers

- (Genre *)isAlreadyHaveGenreWithName:(NSString *)name
{
    NSArray *fetchResults = [HPDatabase genreWithName:name];
    return [fetchResults lastObject];
}

- (Genre *)createNewGenreWithName:(NSString *)name
{
    HPEntityCreator *entityCreator = [HPEntityCreator new];
    entityCreator.entityClass = [Genre class];
    [entityCreator reach];
    
    Genre *newGenre = entityCreator.createdEntityObject;
    newGenre.name = name;
    [HPDatabase saveDataBase];
    return newGenre;
}

@end
