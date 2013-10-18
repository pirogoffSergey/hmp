//
//  HPPickerViewHandler.h
//  HelpMePlay
//
//  Created by Sergey Pirogov on 18.10.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HPPickerViewHandler : NSObject <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, weak) UIPickerView *picker;
@property (nonatomic, strong) NSArray *records;

@property (nonatomic, copy) void (^itemSelectedBlock)(id selectedRecord);

@end
