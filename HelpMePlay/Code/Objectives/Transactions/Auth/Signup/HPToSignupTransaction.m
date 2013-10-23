//
//  HPToSignupTransaction.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 23.10.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPToSignupTransaction.h"
#import "HPSignupViewController.h"
#import "HPBaseTransaction.h"


@implementation HPToSignupTransaction

- (void)execute
{
    HPBaseTransaction *baseTransaction = [HPBaseTransaction new];
    baseTransaction.destinationControllerClass = [HPSignupViewController class];
    baseTransaction.navigationController = self.navigationController;
    [baseTransaction execute];
}

@end
