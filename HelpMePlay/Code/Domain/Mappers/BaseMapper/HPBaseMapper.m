//
//  HPBaseMapper.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 05.09.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPBaseMapper.h"

@implementation HPBaseMapper 

- (id)mapFromData:(id)data withModel:(Class)model
{
    id result = nil;
    if (data && [model conformsToProtocol:@protocol(HPMappingObjectProtocol)]) {
        
        if ([data isKindOfClass:[NSArray class]]) {
            NSArray *inputArray = (NSArray *)data;
            NSMutableArray *mappedObjects = [NSMutableArray array];
            for (NSDictionary *objectDictionary in inputArray) {
                NSObject *object = [model createWithDictionary:objectDictionary];
                [mappedObjects addObject:object];
            }
            result = mappedObjects;
        }
        else if ([data isKindOfClass:[NSDictionary class]]) {
            result = [model createWithDictionary:(NSDictionary *)data];
        }
    }
    return result;
}

@end
