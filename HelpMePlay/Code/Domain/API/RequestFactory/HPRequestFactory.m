//
//  HPRequestFactory.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 24.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPRequestFactory.h"
#import "User.h"
#import "HPDatabase.h"

const struct RequestMethods RequestMethods = {
    .get = @"GET",
    .post = @"POST",
};


@implementation HPRequestFactory

+ (HPRequestFactory *)sharedInstance
{
    static HPRequestFactory *sharedFactory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedFactory = [HPRequestFactory new];
    });
    return sharedFactory;
}


#pragma mark -
#pragma mark Factory Methods

- (HPRequest *)createUserWithName:(NSString *)name login:(NSString *)login password:(NSString *)password
{
//    HPRequest *request = [[HPRequest alloc] initWithURL:[self pathForUserMethods:APICommonMethods.set]];
//    request.HTTPMethod = RequestMethods.post;
//    [request addBody: @{
//         @"name" :name,
//         @"login":login,
//         @"password":password
//     }];
    return [self changeUserWithName:name login:login password:password token:nil];
}

- (HPRequest *)changeUserWithName:(NSString *)name login:(NSString *)login password:(NSString *)password token:(NSString *)token
{
    HPRequest *request = [[HPRequest alloc] initWithURL:[self pathForUserMethods:APICommonMethods.set]];
    request.HTTPMethod = RequestMethods.post;
    [request addBody: @{
                        @"name" :name,
                        @"login":login,
                        @"password":password
    }];
    
    if(token && token.length) {
        [request addBody:@{@"token":token}];
    }
    return request;
}


- (HPRequest *)loginWithLogin:(NSString *)login password:(NSString *)password
{
    HPRequest *request = [[HPRequest alloc] initWithURL:[self pathForUserMethods:APIUserMethods.auth]];
    request.HTTPMethod = RequestMethods.post;
    [request addBody: @{
         @"login"   :login,
         @"password":password
     }];
    return request;
}

- (HPRequest *)isLogged:(NSString *)token
{
    HPRequest *request = [[HPRequest alloc] initWithURL:[self pathForUserMethods:APIUserMethods.isLogged]];
    request.HTTPMethod = RequestMethods.get;
    [request addBody: @{
         @"token"   :token,
     }];
    return request;
}

- (HPRequest *)logout
{
    [HPDatabase restoreCurrentUser];
    return nil;
}

- (HPRequest *)getUserInfoWithToken:(NSString *)token userID:(NSNumber *)userId
{
    HPRequest *request = [[HPRequest alloc] initWithURL:[self pathForUserMethods:APICommonMethods.get]];
    request.HTTPMethod = RequestMethods.get;
    [request addBody: @{
         @"token"   :token,
         @"id"      :userId,
     }];
    
    return request;
}


// --------------

- (HPRequest *)getAuthorsWithToken:(NSString *)token authorID:(NSNumber *)authID
{
    HPRequest *request = [[HPRequest alloc] initWithURL:@"authors/get"];
    request.HTTPMethod = RequestMethods.get;
    [request addBody: @{
                        @"token"   :token,
                        @"id"      :authID,
                        }];
    
    return request;
}



// --------------

- (HPRequest *)getPicWithID:(NSNumber *)picID token:(NSString *)token
{
    HPRequest *request = [[HPRequest alloc] initWithURL:[self pathForFilesMethods:APICommonMethods.get]];
    request.HTTPMethod = RequestMethods.get;
    
    [request addBody: @{
                        @"token":token,
                        @"id":picID }];
    return request;
}

- (HPRequest *)sendPic:(UIImage *)pic withToken:(NSString *)token
{
    HPRequest *request = [[HPRequest alloc] initWithURL:[self pathForFilesMethods:APIFilesMethods.upload]];
    request.HTTPMethod = RequestMethods.post;
    
    NSData *dataObj = UIImageJPEGRepresentation(pic, 1.0);
    [request addBody: @{
                        @"token":token,
                        @"file":dataObj }];
    return request;
}


#pragma mark -
#pragma mark Helpers

- (NSString *)pathForUserMethods:(NSString *)subPath
{
    return [NSString stringWithFormat:@"%@/%@", APIGroups.users, subPath];
}

- (NSString *)pathForFilesMethods:(NSString *)subPath
{
    return [NSString stringWithFormat:@"%@/%@", APIGroups.files, subPath];
}

- (NSString *)encodeToValidURLString:(NSString *)string
{
    return [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end
