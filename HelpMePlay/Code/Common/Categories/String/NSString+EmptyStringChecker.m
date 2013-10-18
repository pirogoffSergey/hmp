//
//  NSString+EmptyStringChecker.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 18.10.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "NSString+EmptyStringChecker.h"

@implementation NSString (EmptyStringChecker)

- (BOOL)isEmpty
{
    NSCharacterSet *spacesSet = [NSCharacterSet whitespaceCharacterSet];
    if(!self || [self isEqualToString:@""] || ([self stringByTrimmingCharactersInSet:spacesSet].length == 0)) {
        return YES;
    }
    else {
        return NO;
    }
}

@end
