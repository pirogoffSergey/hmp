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
@property (nonatomic, strong) NSDictionary *body;

@end


@implementation HPRequest

- (id)initWithURL:(NSString *)itemURL
{
    NSParameterAssert(itemURL);
    self = [super init];
    if (self != nil) {
        self.URL = [NSURL URLWithString:itemURL];
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

- (void)addBody:(NSDictionary *)body
{
    self.body = body;
}

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
        
        AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:APIUrls.baseURL]];
        urlRequest = [httpClient requestWithMethod:[self currentHTTPMethod]
                                              path:nil
                                        parameters:self.body];
        urlRequest.timeoutInterval = 60/*sec*/ *2; // 2 minutes
    }
    return urlRequest;
}

- (NSString *)currentHTTPMethod
{
    return (self.HTTPMethod && self.HTTPMethod.length) ? self.HTTPMethod : @"GET";
}


#pragma mark -
#pragma mark Finish Handlers

- (AFSuccessBlock)defaultSuccessBlock
{
    return ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"status code %d",[operation.response statusCode]);
        
        id responseDictionary = [operation.responseString objectFromJSONString];
        
        if(self.successBlock) {
            self.successBlock(operation, responseDictionary);
        }
        else {
            NSLog(@"downlaoded successfuly with response: %@", operation.responseString);
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
