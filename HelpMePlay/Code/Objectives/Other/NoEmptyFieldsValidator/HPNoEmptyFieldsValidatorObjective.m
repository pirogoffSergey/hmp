//
//  HPNoEmptyFieldsValidatorObjective.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 31.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPNoEmptyFieldsValidatorObjective.h"

@implementation HPNoEmptyFieldsValidatorObjective 

- (void)reach
{
    NSParameterAssert(self.textFields);
    [self checkIsAllObjectsAreTextFields];
    
    for (UITextField *tf in self.textFields) {
        if ([tf isTextFieldEmpty]) {
            _checkingResult = NO;
            _numberOfFirstInvalidField = [self.textFields indexOfObject:tf];
            return;
        }
    }
    _checkingResult = YES;
}

- (void)checkIsAllObjectsAreTextFields
{
    for (id elem in self.textFields) {
        NSAssert([elem isKindOfClass:[UITextField class]], @"All objects should be UITextField type");
    }
}

@end
