//
//  UITextField+EmptyChecker.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 18.10.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "UITextField+EmptyChecker.h"

@implementation UITextField (EmptyChecker)

- (BOOL)isTextFieldEmpty
{
     return (!self.text || [self.text isEmpty]);
}

@end
