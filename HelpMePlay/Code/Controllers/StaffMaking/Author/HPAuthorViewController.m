//
//  HPAuthorViewController.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 21.09.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPAuthorViewController.h"
#import "HPNavBarElementsProducer.h"

typedef enum {
    HPPickerVisibile,
    HPPickerInvisible,
} HPPickerVisibility;



@interface HPAuthorViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *dateOfBirthTextField;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) UIDatePicker *datePicker;

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
#pragma mark Actions

- (void)doneButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)itsBandPressed:(id)sender
{
    
}

- (IBAction)relatedSongsPressed:(id)sender
{
    
}

@end
