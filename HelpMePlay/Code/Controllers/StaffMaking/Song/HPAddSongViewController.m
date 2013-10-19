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
#import "FDTakeController.h"
#import "HPNavBarElementsProducer.h"

#import "HPEntityCreator.h"
#import "Record.h"
#import "Genre.h"
#import "Author.h"


@interface HPAddSongViewController () <UIScrollViewDelegate, FDTakeDelegate>

@property (weak, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIView *someview;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIButton *pictureButton;
@property (nonatomic, assign) BOOL isCoverSet;

@property (weak, nonatomic) IBOutlet UIView *titleViewContainer;
@property (weak, nonatomic) IBOutlet UITextField *authorTextField;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *genreTextField;

@property (nonatomic, strong) HPPickerViewHandler *pickerManagerGenres;
@property (nonatomic, strong) HPPickerViewHandler *pickerManagerAuthors;
@property (nonatomic, strong) FDTakeController *takePhotoController;


@property (nonatomic, strong) Genre *selectedGenre;
@property (nonatomic, strong) Author *selectedAuthor;

@end


@implementation HPAddSongViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupAppearance];
}


#pragma mark -
#pragma mark Setup

- (void)setupAppearance
{
    [self setupAuthorsPicker];
    [self setupGenrePicker];
    
    self.scrollView.contentSize = CGSizeMake(320, 600);
    [self.titleViewContainer addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)]];
    self.navigationItem.rightBarButtonItem = [HPNavBarElementsProducer doneButtonWithTarget:self action:@selector(doneButtonPressed:)];
}

- (void)setupAuthorsPicker
{
    UIPickerView *myPickerView = [[UIPickerView alloc] init];
    myPickerView.showsSelectionIndicator = YES;
    self.authorTextField.inputView = myPickerView;
    
    self.pickerManagerAuthors = [HPPickerViewHandler new];
    self.pickerManagerAuthors.records = [HPDatabase allAuthors];
    self.pickerManagerAuthors.picker = myPickerView;
    
    __weak HPAddSongViewController *weakSelf = self;
    self.pickerManagerAuthors.itemSelectedBlock = ^(id selectedItem, NSString *selectedString) {
        weakSelf.authorTextField.text = selectedString;
        weakSelf.selectedAuthor = selectedItem;
    };
}

- (void)setupGenrePicker
{
    UIPickerView *myPickerView = [[UIPickerView alloc] init];
    myPickerView.showsSelectionIndicator = YES;
    self.genreTextField.inputView = myPickerView;
    
    self.pickerManagerGenres = [HPPickerViewHandler new];
    self.pickerManagerGenres.records = [HPDatabase allGenres];
    self.pickerManagerGenres.picker = myPickerView;
    
    __weak HPAddSongViewController *weakSelf = self;
    self.pickerManagerGenres.itemSelectedBlock = ^(id selectedItem, NSString *selectedString) {
        weakSelf.genreTextField.text = selectedString;
        weakSelf.selectedGenre = selectedItem;
    };
}


#pragma mark -
#pragma mark Actions

- (void)didTap:(UITapGestureRecognizer *)gr
{
    RESIGN_ALL;
}

- (IBAction)changePicButtonPressed:(id)sender
{
    if(!self.takePhotoController) {
        self.takePhotoController = [FDTakeController new];
        self.takePhotoController.delegate = self;
        self.takePhotoController.viewControllerForPresentingImagePickerController = self;
    }
    [self.takePhotoController takePhotoOrChooseFromLibrary];
}

- (void)doneButtonPressed:(id)sender
{
    if([self createSongWithCurrentData]) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


#pragma mark -
#pragma mark FDTakeDelegate

- (void)takeController:(FDTakeController *)controller gotPhoto:(UIImage *)photo withInfo:(NSDictionary *)info;
{
    self.pictureButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.pictureButton setImage:photo forState:UIControlStateNormal];
    self.isCoverSet = YES;
}


#pragma mark -
#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    RESIGN_ALL;
}


#pragma mark -
#pragma mark Helpers

- (Record *)createSongWithCurrentData
{
    if([self.titleTextField isTextFieldEmpty]) {
        [HPAlert showErroMessage:@"Please, input at least Title"];
        return nil;
    }
    
    HPEntityCreator *entityCreator = [HPEntityCreator new];
    entityCreator.entityClass = [Record class];
    [entityCreator reach];
    
    Record *newRecord = entityCreator.createdEntityObject;
    newRecord.title = self.titleTextField.text;
    newRecord.cover = (self.isCoverSet) ? self.pictureButton.imageView.image : nil;
    newRecord.genre = self.selectedGenre;
    newRecord.composer = (self.selectedAuthor) ? [NSSet setWithObject:self.selectedAuthor]: nil;
    [HPDatabase saveDataBase];
    return newRecord;
}

@end
