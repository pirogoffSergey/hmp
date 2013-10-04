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
    __unsafe_unretained NSString *files;
    __unsafe_unretained NSString *authors;
    __unsafe_unretained NSString *genres;
    __unsafe_unretained NSString *songs;
} APIGroups;




extern const struct APICommonMethods {
    __unsafe_unretained NSString *set;
    __unsafe_unretained NSString *get;
    __unsafe_unretained NSString *search;
} APICommonMethods;



extern const struct APIUserMethods {
    __unsafe_unretained NSString *auth;
    __unsafe_unretained NSString *isLogged;
} APIUserMethods;


extern const struct APIFilesMethods {
    __unsafe_unretained NSString *upload;
} APIFilesMethods;

