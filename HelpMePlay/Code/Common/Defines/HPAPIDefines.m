//
//  HPAPIDefines.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 25.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPAPIDefines.h"

const struct APIUrls APIUrls = {
    .baseURL = @"http://viodev.bget.ru",
};


const struct APIGroups APIGroups = {
    .users = @"users",
//    .usersGet = @"users.get",
//    .usersAuth = @"users.auth",
//    .usersIsLogged = @"users.isLogged",
};


//const struct APIGroups APIGroups = {
//    .usersSet = @"users.set",
//    .usersGet = @"users.get",
//    .usersAuth = @"users.auth",
//    .usersIsLogged = @"users.isLogged",
//};


const struct APIUserMethods APIUserMethods = {
    .set = @"set",
    .get = @"get",
    .auth = @"auth",
    .isLogged = @"isLogged",
};
