//
//  HPGenreAddViewController.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 18.10.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPGenreAddViewController.h"
#import "HPEntityCreator.h"
#import "Genre.h"


@interface HPGenreAddViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end


@implementation HPGenreAddViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}


#pragma mark -
#pragma mark Actions

- (IBAction)addPressed:(id)sender
{
    if([self.nameTextField isTextFieldEmpty]) {
        [HPAlert showErroMessage:@"Please, input name of genre"];
        return;
    }
    
    if([self isAlreadyHaveGenreWithName:self.nameTextField.text]) {
        [HPAlert showErroMessage:@"Genre \"%@\" is already exists", self.nameTextField.text];
        return;
    }
    
    [self createNewGenreWithName:self.nameTextField.text];
    
    RESIGN_ALL;
    [HPAlert showSuccesMessage:@"Done"];
}


#pragma mark -
#pragma mark Helpers

- (Genre *)isAlreadyHaveGenreWithName:(NSString *)name
{
    NSArray *fetchResults = [HPDatabase genreWithName:self.nameTextField.text];
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
