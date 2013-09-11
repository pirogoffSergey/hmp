//
//  HPAlert.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 11.09.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPAlert.h"


@implementation HPAlert

+ (void)showSuccesMessage:(NSString *)message
{
    [SVProgressHUD setShouldHideByTap:YES];
    [SVProgressHUD showSuccessWithStatus:message];
}

+ (void)showErroMessage:(NSString *)message
{
    [SVProgressHUD setShouldHideByTap:YES];
    [SVProgressHUD showErrorWithStatus:message];
}

@end
