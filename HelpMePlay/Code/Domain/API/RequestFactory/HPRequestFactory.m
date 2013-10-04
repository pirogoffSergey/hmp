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
    HPRequest *request = [[HPRequest alloc] initWithURL:[self pathForUserMethods:APIUserMethods.set]];
    request.HTTPMethod = RequestMethods.post;
    [request addBody: @{
         @"name" :name,
         @"login":login,
         @"password":password
     }];
    return request;
}

- (HPRequest *)loginWithLogin:(NSString *)login password:(NSString *)password
{
   // HPRequest *request = [[HPRequest alloc] initWithURL:[self pathForUserMethods:APIUserMethods.auth]];
    HPRequest *request = [HPRequest new];
    request.HTTPMethod = RequestMethods.post;
    [request addBody: @{
        @"method"   :@"users.auth",
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
    HPRequest *request = [[HPRequest alloc] initWithURL:[self pathForUserMethods:APIUserMethods.get]];
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

- (HPRequest *)getPic:(User *)usr
{
    HPRequest *request = [[HPRequest alloc] initWithURL:@"files/get"];
    request.HTTPMethod = RequestMethods.get;
    
    [request addBody: @{
                        @"token":usr.token,
                        @"id":@2 }];
    
    return request;
}

- (HPRequest *)sendPic:(User *)usr
{
    HPRequest *request = [[HPRequest alloc] initWithURL:@"files/upload"];
    request.HTTPMethod = RequestMethods.post;
    
    UIImage *image = [UIImage imageNamed:@"icon"];
    NSData *dataObj = UIImageJPEGRepresentation(image, 1.0);
    
    [request addBody: @{
                        @"token":usr.token,
                        @"file":dataObj }];
    
    return request;
    
    
//    HPRequest *request = [HPRequest new];
//    request.HTTPMethod = RequestMethods.post;
//    
//    UIImage *image = [UIImage imageNamed:@"icon"];
//    NSData *dataObj = UIImageJPEGRepresentation(image, 1.0);
//    
//    [request addBody: @{
//     @"method":@"users.test",
//     @"img":dataObj }];
//    return request;
}


#pragma mark -
#pragma mark Helpers

- (NSString *)pathForUserMethods:(NSString *)subPath
{
    return [NSString stringWithFormat:@"%@/%@", APIGroups.users, subPath];
}

- (BOOL)isClearString:(NSString *)string
{
    NSCharacterSet *spacesSet = [NSCharacterSet whitespaceCharacterSet];
    if(!string || [string isEqualToString:@""] || ([string stringByTrimmingCharactersInSet:spacesSet].length == 0)) {
        return YES;
    }
    else {
        return NO;
    }
}

- (NSString *)encodeToValidURLString:(NSString *)string
{
    return [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end
