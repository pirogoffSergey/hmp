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
    HPRequest *request = [HPRequest new];
    request.HTTPMethod = RequestMethods.post;
    [request addBody: @{
         @"method": APIGroups.usersSet,
         @"name" :name,
         @"login":login,
         @"password":password
     }];
    return request;
}

- (HPRequest *)loginWithLogin:(NSString *)login password:(NSString *)password
{
    HPRequest *request = [HPRequest new];
    request.HTTPMethod = RequestMethods.post;
    [request addBody: @{
         @"method"  : APIGroups.usersAuth,
         @"login"   :login,
         @"password":password
     }];
    return request;
}

- (HPRequest *)logout
{
    [HPDatabase restoreCurrentUser];
    return nil;
}

- (HPRequest *)sendPic
{
    HPRequest *request = [HPRequest new];
    request.HTTPMethod = RequestMethods.post;
    
    UIImage *image = [UIImage imageNamed:@"icon"];
    NSData *dataObj = UIImageJPEGRepresentation(image, 1.0);
    
    [request addBody: @{
     @"method":@"users.test",
     @"img":dataObj }];
    return request;
}


#pragma mark -
#pragma mark Helpers

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
