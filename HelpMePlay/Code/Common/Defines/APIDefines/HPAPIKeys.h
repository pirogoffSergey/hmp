//
//  HPAPIKeys.h
//  HelpMePlay
//
//  Created by Sergey Pirogov on 04.10.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const struct APICommonKeys {
    __unsafe_unretained NSString *id_;
    __unsafe_unretained NSString *errorCode;
} APICommonKeys;


extern const struct APIUserKeys {
    __unsafe_unretained NSString *user;
    __unsafe_unretained NSString *login;
    __unsafe_unretained NSString *name;
    __unsafe_unretained NSString *avatar;
} APIUserKeys;

