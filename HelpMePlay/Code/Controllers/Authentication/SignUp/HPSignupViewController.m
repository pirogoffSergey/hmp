//
//  HPSignupViewController.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 31.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPSignupViewController.h"
#import "HPNoEmptyFieldsValidatorObjective.h"


@interface HPSignupViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *userpicButton;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *loginField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end


@implementation HPSignupViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupNoUserpicButton];
}


#pragma mark -
#pragma mark Setupers

- (void)setupNoUserpicButton
{
    int rand = arc4random()%2;
    if(rand) {
        [self.userpicButton setImage:[UIImage imageNamed:@"nouser_male.jpg"] forState:UIControlStateNormal];
    }
}


#pragma mark -
#pragma mark UITextFieldDelegate

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    RESIGN_ALL;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    RESIGN_ALL;
    return YES;
}


#pragma mark -
#pragma mark Actions

- (IBAction)createUserTapped:(id)sender
{
    if([self isFieldsDataValid]) {
        //send request
    }
}


#pragma mark -
#pragma mark Helpers

- (BOOL)isFieldsDataValid
{
    HPNoEmptyFieldsValidatorObjective *validator = [HPNoEmptyFieldsValidatorObjective new];
    validator.textFields = @[self.nameField, self.loginField, self.passwordField];
    [validator reach];
    return validator.checkingResult;
}


@end
