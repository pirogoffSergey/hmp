//
//  HPAlert.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 11.09.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPAlert.h"


@implementation HPAlert

+ (void)showSuccesMessage:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2)
{
    va_list args;
    va_start(args, format);
    NSString *message = [[NSString alloc] initWithFormat:format arguments:args];

    [SVProgressHUD setShouldHideByTap:YES];
    [SVProgressHUD showSuccessWithStatus:message];
}


+ (void)showErroMessage:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2)
{
    va_list args;
    va_start(args, format);
    NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
    
    [SVProgressHUD setShouldHideByTap:YES];
    [SVProgressHUD showErrorWithStatus:message];
}

@end
