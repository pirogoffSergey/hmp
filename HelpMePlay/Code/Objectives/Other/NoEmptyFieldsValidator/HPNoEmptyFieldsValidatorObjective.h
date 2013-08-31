//
//  HPNoEmptyFieldsValidatorObjective.h
//  HelpMePlay
//
//  Created by Sergey Pirogov on 31.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HPObjective.h"

@interface HPNoEmptyFieldsValidatorObjective : NSObject <HPObjective>

@property (nonatomic, strong) NSArray *textFields;

@property (nonatomic, assign, readonly) BOOL checkingResult;
@property (nonatomic, assign, readonly) int numberOfFirstInvalidField;

@end
