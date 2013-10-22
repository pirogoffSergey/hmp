//
//  HPAPIDefines.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 25.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPAPIDefines.h"

const struct APIUrls APIUrls = {
    .baseURL = @"http://viodevcw.bget.ru", // viodev.bget.ru    viodev4p.bget.ru
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
};


const struct APIUserMethods APIUserMethods = {
    .auth = @"auth",
    .isLogged = @"isLogged",
};


const struct APIFilesMethods APIFilesMethods = {
    .upload = @"upload",
};






