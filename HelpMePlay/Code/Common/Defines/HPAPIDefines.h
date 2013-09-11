//
//  HPAPIDefines.h
//  HelpMePlay
//
//  Created by Sergey Pirogov on 25.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const struct APIUrls {
    __unsafe_unretained NSString *baseURL;
} APIUrls;


extern const struct APIGroups {
    __unsafe_unretained NSString *users;
//    __unsafe_unretained NSString *usersGet;
//    __unsafe_unretained NSString *usersAuth;
//    __unsafe_unretained NSString *usersIsLogged;
} APIGroups;


extern const struct APIUserMethods {
    __unsafe_unretained NSString *set;
    __unsafe_unretained NSString *get;
    __unsafe_unretained NSString *auth;
    __unsafe_unretained NSString *isLogged;
} APIUserMethods;
