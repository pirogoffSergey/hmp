//
//  HPAuthenticationViewController.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 31.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPLoginViewController.h"
#import "HPRequestFactory.h"
#import "HPNoEmptyFieldsValidatorObjective.h"
#import "HPSignupViewController.h"
#import "HPBaseMapper.h"
#import "HPNavBarElementsProducer.h"


@interface HPLoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *loginField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end


@implementation HPLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupCloseButton];
}


#pragma mark -
#pragma mark Setupers

- (void)setupCloseButton
{
    self.navigationItem.leftBarButtonItem = [HPNavBarElementsProducer closeButtonWithTarget:self action:@selector(closeButtonPressed:)];
}


#pragma mark -
#pragma mark Actions

- (IBAction)loginButtonPressed:(id)sender
{
    if([self isFieldsDataValid]) {
        HPRequest *req = [self loginRequest];
        [req start];
    }
}

- (IBAction)signUpButtonPressed:(id)sender
{
    [self.navigationController pushViewController:[HPSignupViewController new] animated:YES];
}

- (void)closeButtonPressed:(id)sender
{
    [self.navigationController dismissModalViewControllerAnimated:YES];
}


#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)isFieldsDataValid
{
    HPNoEmptyFieldsValidatorObjective *validator = [HPNoEmptyFieldsValidatorObjective new];
    validator.textFields = @[self.loginField, self.passwordField];
    [validator reach];
    return validator.checkingResult;
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
#pragma mark Helpers

- (HPRequest *)loginRequest
{
    HPRequest *request = [[HPRequestFactory sharedInstance] loginWithLogin:self.loginField.text password:self.passwordField.text];
    
    request.successBlock = ^(AFHTTPRequestOperation *operation, id responseObject){
        
        User *currentUser = [HPDatabase currentUser];
        if(!currentUser) {
            currentUser = [HPDatabase createUser];
        }
        [currentUser setupWithDictionary:responseObject];
        
        [HPDatabase saveDataBase];
        [self closeButtonPressed:nil];
        NSLog(@"token = %@", currentUser.token);
        
        NSString *userName = (currentUser.name) ? currentUser.name : currentUser.login;
        [HPAlert showSuccesMessage:[NSString stringWithFormat:@"Hello, %@", userName]];
    };
    
    return request;
}

@end
