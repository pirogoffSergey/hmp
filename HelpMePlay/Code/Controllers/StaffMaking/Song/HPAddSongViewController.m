//
//  HPAddSongViewController.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 21.09.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPAddSongViewController.h"
#import "HPPickerViewHandler.h"
#import "SDSegmentedControl.h"


@interface HPAddSongViewController () <UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIView *someview;

@property (weak, nonatomic) IBOutlet UITextField *authorTextField;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *genreTextField;

@property (nonatomic, strong) HPPickerViewHandler *pickerManager;

@end


@implementation HPAddSongViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setuper];
}


#pragma mark -
#pragma mark Setup

- (void)setuper
{
    [self setupPicker];
}

- (void)setupPicker
{
    UIPickerView *myPickerView = [[UIPickerView alloc] init];
    myPickerView.showsSelectionIndicator = YES;
    self.genreTextField.inputView = myPickerView;
    
    self.pickerManager = [HPPickerViewHandler new];
    self.pickerManager.records = @[@"rec1", @"rec2", @"recNn"];
    self.pickerManager.picker = myPickerView;
}


#pragma mark -
#pragma mark Actions

- (IBAction)changePicButtonPressed:(id)sender
{
    
}

@end
