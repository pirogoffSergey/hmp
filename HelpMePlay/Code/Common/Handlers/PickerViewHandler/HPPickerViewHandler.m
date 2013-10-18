//
//  HPPickerViewHandler.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 18.10.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPPickerViewHandler.h"


static CGFloat cSectionWidth = 300;


@implementation HPPickerViewHandler

-(void)setPicker:(UIPickerView *)picker
{
    _picker = picker;
    _picker.delegate = self;
    _picker.dataSource = self;
}


#pragma mark -
#pragma mark DataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSParameterAssert(self.records);
    return self.records.count;
}


#pragma mark -
#pragma mark Delegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    id recordToPresent = self.records[row];
    NSLog(@"selected %@", recordToPresent);
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)componen
{
    id recordToPresent = self.records[row];
    NSString *text = @"can't_show record";
    
    if([recordToPresent isKindOfClass:[NSString class]]) {
        text = recordToPresent;
    }
    else if([recordToPresent respondsToSelector:@selector(title)]) {
        text = [recordToPresent performSelector:@selector(title)];
    }
    else if([recordToPresent respondsToSelector:@selector(name)]) {
        text = [recordToPresent performSelector:@selector(name)];
    }
    
    return text;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return cSectionWidth;
}

@end
