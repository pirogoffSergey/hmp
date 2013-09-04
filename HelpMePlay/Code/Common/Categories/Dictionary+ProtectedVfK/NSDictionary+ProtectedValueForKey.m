//
//  NSDictionary+ProtectedValueForKey.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 05.09.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "NSDictionary+ProtectedValueForKey.h"

@implementation NSDictionary (ProtectedValueForKey)

- (id)protectedValueForKey:(id)aKey
{
    id value = [self objectForKey:aKey];
    if ([value isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return value;
}

@end
