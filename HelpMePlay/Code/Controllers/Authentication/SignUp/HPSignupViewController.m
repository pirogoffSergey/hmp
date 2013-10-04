//
//  HPSignupViewController.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 31.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPSignupViewController.h"
#import "HPNoEmptyFieldsValidatorObjective.h"
#import "FDTakeController.h"
#import "HPRequestFactory.h"
#import "HPBaseMapper.h"


@interface HPSignupViewController () <UITextFieldDelegate, FDTakeDelegate>

@property (weak, nonatomic) IBOutlet UIButton *userpicButton;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *loginField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *actionButton;

@property (nonatomic, strong) FDTakeController *takePhotoController;

@property (nonatomic, strong) User *userForContent;
@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSString *pass;

@end


@implementation HPSignupViewController

- (HPSignupViewController *)initUserInfoControllerWithUser:(User *)user
{
    self = [super init];
    if (self) {
        self.userForContent = user;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupAppearance];
}

- (NSString *)title
{
    return (self.userForContent) ? @"User Info" : @"Sign Up";
}


#pragma mark -
#pragma mark Setupers

- (void)setupAppearance
{
    if(self.userForContent) {
        [self setupWithUser:self.userForContent];
    }
    else {
        [self setupNoUserpicButton];
    }
}

- (void)setupWithUser:(User *)aUser
{
    self.nameField.text = aUser.name;
    self.passwordField.text = @"not_available_now";
    self.loginField.text = aUser.login;
    
    UIImage *userPic = (aUser.userpic) ? aUser.userpic : [self randNoUserpicImage];
    [self.userpicButton setImage:userPic forState:UIControlStateNormal];
    [self.actionButton setTitle:@"Change info" forState:UIControlStateNormal];
}

- (void)setupNoUserpicButton
{
    [self.userpicButton setImage:[self randNoUserpicImage] forState:UIControlStateNormal];
}


#pragma mark -
#pragma mark Actions

- (IBAction)changePhotoPressed:(id)sender
{
    if(!self.takePhotoController) {
        self.takePhotoController = [FDTakeController new];
        self.takePhotoController.delegate = self;
        self.takePhotoController.viewControllerForPresentingImagePickerController = self;
    }
    [self.takePhotoController takePhotoOrChooseFromLibrary];
}

- (IBAction)createUserTapped:(id)sender
{
    if([self isFieldsDataValid]) {

        //send request
        self.login = self.loginField.text;
        self.pass = self.passwordField.text;
        
        HPRequest *request = (self.userForContent) ? [self changeInfoRequest] : [self sighUpRequest];
        [request start];
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
#pragma mark FDTakeDelegate

- (void)takeController:(FDTakeController *)controller gotPhoto:(UIImage *)photo withInfo:(NSDictionary *)info;
{
    [self.userpicButton setImage:photo forState:UIControlStateNormal];
}


#pragma mark -
#pragma mark Requests

- (HPRequest *)sighUpRequest
{
    HPRequest *request = [[HPRequestFactory sharedInstance] createUserWithName:self.nameField.text
                                                                         login:self.loginField.text
                                                                      password:self.passwordField.text];
    request.successBlock = ^(AFHTTPRequestOperation *operation, id responseObject){
        HPRequest *loginRequest = [self loginRequest];
        [loginRequest start];
    };
    return request;
}

- (HPRequest *)loginRequest
{
    HPRequest *request = [[HPRequestFactory sharedInstance] loginWithLogin:self.login password:self.pass];
    
    request.successBlock = ^(AFHTTPRequestOperation *operation, id responseObject){
        
        User *currentUser = [HPDatabase currentUser];
        if(!currentUser) {
            currentUser = [HPDatabase createUser];
        }
        [currentUser setupWithDictionary:responseObject];
        
        [HPDatabase saveDataBase];
        [self.navigationController dismissModalViewControllerAnimated:YES];
        NSLog(@"token = %@", currentUser.token);
        
        NSString *userName = (currentUser.name) ? currentUser.name : currentUser.login;
        [HPAlert showSuccesMessage:[NSString stringWithFormat:@"Welcome, %@", userName]];
    };
    
    return request;
}

- (HPRequest *)changeInfoRequest
{
    HPRequest *request = [[HPRequestFactory sharedInstance] changeUserWithName:self.nameField.text
                                                                         login:self.loginField.text
                                                                      password:self.passwordField.text
                                                                         token:self.userForContent.token];
    
    request.successBlock = ^(AFHTTPRequestOperation *operation, id responseObject){
        
        User *currentUser = [HPDatabase currentUser];
        currentUser.login = self.login;
        currentUser.name = self.nameField.text;
        [HPDatabase saveDataBase];
        
        [HPAlert showSuccesMessage:@"Your personal info changed successfully"];
    };
    return request;
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

- (UIImage *)randNoUserpicImage
{
    int rand = arc4random()%2;
    UIImage *result = (rand) ? [UIImage imageNamed:@"nouser_male.jpg"] : [UIImage imageNamed:@"nouser_female.png"];
    return result;
}

- (void)viewDidUnload {
    [self setActionButton:nil];
    [super viewDidUnload];
}
@end
