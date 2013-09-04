//
//  HPMappingObjectProtocol.h
//  HelpMePlay
//
//  Created by Sergey Pirogov on 05.09.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HPMappingObjectProtocol <NSObject>

+ (id)createWithDictionary:(NSDictionary *)aDictionary;

@end
