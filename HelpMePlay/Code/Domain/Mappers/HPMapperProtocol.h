//
//  HPMapperProtocol.h
//  HelpMePlay
//
//  Created by Sergey Pirogov on 05.09.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HPMapperProtocol <NSObject>

- (id)mapFromData:(id)data withModel:(Class)model;

@end
