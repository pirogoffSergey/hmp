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


- (IBAction)addPressed:(id)sender
{
    if([self.nameTextField isTextFieldEmpty]) {
        [HPAlert showErroMessage:@"Please, input name of genre"];
        return;
    }
    
    HPEntityCreator *entityCreator = [HPEntityCreator new];
    entityCreator.entityClass = [Genre class];
    [entityCreator reach];
    
    Genre *newGenre = entityCreator.createdEntityObject;
    newGenre.name = self.nameTextField.text;
    
    [HPDatabase saveDataBase];
    RESIGN_ALL;
    [HPAlert showSuccesMessage:@"Done"];
}

@end
