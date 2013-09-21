//
//  HPAuthorViewController.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 21.09.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPAuthorViewController.h"
#import "HPNavBarElementsProducer.h"
#import "FDTakeController.h"
#import "HPEntityCreator.h"
#import "Author.h"

typedef enum {
    HPPickerVisibile,
    HPPickerInvisible,
} HPPickerVisibility;



@interface HPAuthorViewController () <UITextFieldDelegate, FDTakeDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstNameTF;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTF;
@property (weak, nonatomic) IBOutlet UITextField *countryTF;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSelector;
@property (weak, nonatomic) IBOutlet UIButton *authorPicButton;


@property (weak, nonatomic) IBOutlet UITextField *dateOfBirthTextField;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) UIDatePicker *datePicker;

@property (nonatomic, strong) FDTakeController *takePhotoController;

@end


@implementation HPAuthorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupAppearance];
}

- (NSString *)title
{
    return @"Add Author";
}


#pragma mark -
#pragma mark Setupers

- (void)setupAppearance
{
    self.navigationItem.rightBarButtonItem = [HPNavBarElementsProducer doneButtonWithTarget:self action:@selector(doneButtonPressed:)];
    [self setupDateOfBirth];
}

- (void)setupDateOfBirth
{
    self.datePicker = [[UIDatePicker alloc] init];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker.maximumDate = [NSDate date];
    self.dateOfBirthTextField.inputView = self.datePicker;

    self.dateFormatter = [NSDateFormatter new];
    self.dateFormatter.dateStyle = kCFDateFormatterLongStyle;
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

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField == self.dateOfBirthTextField) {
        self.datePicker.tag = HPPickerVisibile;
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.dateOfBirthTextField) {
        self.datePicker.tag = HPPickerInvisible;
        self.dateOfBirthTextField.text = [self.dateFormatter stringFromDate:self.datePicker.date];
    }
}


#pragma mark -
#pragma mark FDTakeDelegate

- (void)takeController:(FDTakeController *)controller gotPhoto:(UIImage *)photo withInfo:(NSDictionary *)info;
{
    [self.authorPicButton setImage:photo forState:UIControlStateNormal];
}


#pragma mark -
#pragma mark Actions

- (void)doneButtonPressed:(id)sender
{
    [self createAuthorWithCurrentData];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)changePhotoPressed:(id)sender
{
    if(!self.takePhotoController) {
        self.takePhotoController = [FDTakeController new];
        self.takePhotoController.delegate = self;
        self.takePhotoController.viewControllerForPresentingImagePickerController = self;
    }
    [self.takePhotoController takePhotoOrChooseFromLibrary];
}

- (IBAction)itsBandPressed:(id)sender
{
    
}

- (IBAction)relatedSongsPressed:(id)sender
{
    
}


#pragma mark -
#pragma mark Helpers

- (Author *)createAuthorWithCurrentData
{
    HPEntityCreator *creator = [HPEntityCreator new];
    creator.entityClass = [Author class];
    [creator reach];
    
    Author *author = creator.createdEntityObject;
    author.name = self.firstNameTF.text;
    author.lastName = self.lastNameTF.text;
    author.country = self.countryTF.text;
    author.gender = (!self.genderSelector.selectedSegmentIndex) ? @"male" : @"female";
    author.pic = self.authorPicButton.imageView.image;
    
    [HPDatabase saveDataBase];
    return author;
}

@end
