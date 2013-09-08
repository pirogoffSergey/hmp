//
//  HPBaseResponseObject.h
//  HelpMePlay
//
//  Created by Sergey Pirogov on 08.09.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HPMappingObjectProtocol.h"

@interface HPBaseResponseObject : NSObject <HPMappingObjectProtocol>

@property (nonatomic, assign) NSInteger _id;
@property (nonatomic, assign) NSInteger errorCode;
@property (nonatomic, strong) id additionalField;

@end
