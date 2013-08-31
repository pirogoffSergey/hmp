//
//  HPAuthenticationViewController.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 31.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPLoginViewController.h"
#import "HPRequestFactory.h"


@interface HPLoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *loginField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end


@implementation HPLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}


#pragma mark -
#pragma mark Actions

- (IBAction)loginButtonPressed:(id)sender
{
    if([self isFieldsDataValid]) {
        HPRequest *req = [[HPRequestFactory sharedInstance] loginWithLogin:self.loginField.text password:self.passwordField.text];
        [req start];
    }
}


#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)isFieldsDataValid
{
    BOOL isValid = NO;
    if(self.loginField.text.length) {
        if(self.passwordField.text.length) {
            isValid = YES;
        }
    }
    return isValid;
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

@end
