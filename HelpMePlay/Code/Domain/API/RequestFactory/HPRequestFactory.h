//
//  HPRequestFactory.h
//  HelpMePlay
//
//  Created by Sergey Pirogov on 24.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HPAPIDefines.h"
#import "HPAPIKeys.h"
#import "HPRequest.h"

extern const struct RequestMethods {
    __unsafe_unretained NSString *get;
    __unsafe_unretained NSString *post;
} RequestMethods;


@interface HPRequestFactory : NSObject

+ (HPRequestFactory *)sharedInstance;

//user
- (HPRequest *)createUserWithName:(NSString *)name login:(NSString *)login password:(NSString *)password;
- (HPRequest *)loginWithLogin:(NSString *)login password:(NSString *)password;
- (HPRequest *)isLogged:(NSString *)token;
- (HPRequest *)logout;
- (HPRequest *)getUserInfoWithToken:(NSString *)token userID:(NSNumber *)userId;

//authors
- (HPRequest *)getAuthorsWithToken:(NSString *)token authorID:(NSNumber *)userId;


- (HPRequest *)getPic:(User *)usr;
- (HPRequest *)sendPic:(User *)usr;

@end
