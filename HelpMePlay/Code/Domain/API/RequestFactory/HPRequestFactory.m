//
//  HPRequestFactory.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 24.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPRequestFactory.h"

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
    HPRequest *request = [[HPRequest alloc] initWithURL:@""];
    request.HTTPMethod = RequestMethods.post;
    [request addBody: @{
     @"method":@"users.set",
     @"name" :name,
     @"login":login,
     @"password":password }];
    return request;
}

- (HPRequest *)loginWithLogin:(NSString *)login password:(NSString *)password
{
    return nil;
}

- (HPRequest *)logout
{
    return nil;
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
