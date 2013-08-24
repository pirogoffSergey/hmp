//
//  HPRequest.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 24.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPRequest.h"
#import "JSONKit.h"


@interface HPRequest ()

@property (nonatomic, strong) NSURL *URL;
@property (nonatomic, strong) NSMutableURLRequest *req;

@end


@implementation HPRequest

- (id)initWithURL:(NSURL *)itemURL
{
    NSParameterAssert(itemURL);
    self = [super init];
    if (self != nil) {
        self.URL = itemURL;
    }
    return self;
}

- (id)initWithRequest:(NSMutableURLRequest *)request;
{
    self = [super init];
    if (self) {
        self.req = request;
    }
    return self;
}


#pragma mark -
#pragma mark Request Management

- (void)start
{
    NSMutableURLRequest *urlRequest = [self setupRequest];
    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:urlRequest];
    requestOperation.queuePriority = NSOperationQueuePriorityVeryHigh;
    [requestOperation setCompletionBlockWithSuccess:[self defaultSuccessBlock] failure:[self defaultFailureBlock]];
    [requestOperation start];    
}


#pragma mark -
#pragma mark Helpers

- (NSMutableURLRequest *)setupRequest
{
    NSMutableURLRequest *urlRequest = self.req;
    if (!urlRequest) {
        urlRequest = [[NSMutableURLRequest alloc] initWithURL:self.URL];
        urlRequest.HTTPMethod = (self.HTTPMethod && self.HTTPMethod.length) ? self.HTTPMethod : @"GET";
        urlRequest.timeoutInterval = 60/*sec*/ *2; // 2 minutes
    }
    return urlRequest;
}


#pragma mark -
#pragma mark Finish Handlers

- (AFSuccessBlock)defaultSuccessBlock
{
    return ^(AFHTTPRequestOperation *operation, id responseObject) {
        id responseDictionary = [operation.responseString objectFromJSONString];
        
        if(self.successBlock) {
            self.successBlock(operation, responseDictionary);
        }
        else {
            NSLog(@"downlaoded successfuly with response: %@", responseDictionary);
        }
    };
}

- (AFFailureBlock)defaultFailureBlock
{
    return ^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if(self.failureBlock) {
            self.failureBlock(operation, error);
        }
        else {
            NSLog(@"----------------\nfailure : %@\n\n", error);
        }
    };
}

@end
