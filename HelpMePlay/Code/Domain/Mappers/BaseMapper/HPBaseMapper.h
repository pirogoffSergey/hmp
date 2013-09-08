//
//  HPBaseMapper.h
//  HelpMePlay
//
//  Created by Sergey Pirogov on 05.09.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HPMapperProtocol.h"
#import "HPMappingObjectProtocol.h"
#import "HPBaseResponseObject.h"


@interface HPBaseMapper : NSObject <HPMapperProtocol>

- (id)mapFromData:(id)data withModel:(Class)model;

@end
