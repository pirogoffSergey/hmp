//
//  HPAPIDefines.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 25.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPAPIDefines.h"

const struct APIUrls APIUrls = {
    .baseURL = @"http://viodev4p.bget.ru", // viodev.bget.ru
};


const struct APIGroups APIGroups = {
    .users = @"users",
    .files = @"files",
    .authors = @"authors",
    .genres = @"genres",
    .songs = @"songs",
};



const struct APICommonMethods APICommonMethods = {
    .set = @"set",
    .get = @"get",
    .search = @"search",
//    .isLogged = @"isLogged",
};


const struct APIUserMethods APIUserMethods = {
    .auth = @"auth",
    .isLogged = @"isLogged",
};
