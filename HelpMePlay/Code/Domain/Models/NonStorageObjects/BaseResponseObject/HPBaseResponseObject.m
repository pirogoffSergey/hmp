//
//  HPBaseResponseObject.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 08.09.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPBaseResponseObject.h"
#import "HPAPIKeys.h"


@implementation HPBaseResponseObject

+ (id)createWithDictionary:(NSDictionary *)aDictionary
{
    HPBaseResponseObject *obj = [HPBaseResponseObject new];
    obj._id = ((NSNumber *)[aDictionary valueForKey:APICommonKeys.id_]).integerValue;
    obj.errorCode = ((NSNumber *)[aDictionary valueForKey:APICommonKeys.errorCode]).integerValue;
    obj.additionalField = [HPBaseResponseObject getAdditionals:aDictionary alreadyExistKeys:@[APICommonKeys.id_, APICommonKeys.errorCode]];
    return obj;
}


#pragma mark -
#pragma mark Helpers

+ (id)getAdditionals:(NSDictionary *)dict alreadyExistKeys:(NSArray *)alreadyExistKeys
{
    id additionalObject = nil;
    NSString *thirdKey = @"";
    NSArray *allKeys = [dict allKeys];
    
    if(allKeys.count == 3) {
        for (NSString *key in allKeys) {
            if(![HPBaseResponseObject isString:key inArray:alreadyExistKeys]) {
                thirdKey = key;
                break;
            }
        }
        additionalObject = [dict valueForKey:thirdKey];
    }
    return additionalObject;
}

+ (BOOL)isString:(NSString *)string inArray:(NSArray *)array
{
    for(NSString *s in array) {
        if([s isEqualToString:string]) {
            return YES;
        }
    }
    return NO;
}

@end
