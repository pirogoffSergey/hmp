//
//  HPBaseTransaction.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 23.10.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPBaseTransaction.h"

@implementation HPBaseTransaction

- (void)execute
{
    NSParameterAssert(self.navigationController);
    NSParameterAssert(self.destinationControllerClass);
    
    id destinationController = [self.destinationControllerClass new];
    [self.navigationController pushViewController:destinationController animated:YES];
}

@end
