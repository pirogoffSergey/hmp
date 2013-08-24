//
//  HPRequest.h
//  HelpMePlay
//
//  Created by Sergey Pirogov on 24.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef void (^AFSuccessBlock)(AFHTTPRequestOperation *operation, id responseObject);
typedef void (^AFFailureBlock)(AFHTTPRequestOperation *operation, NSError *error);


@interface HPRequest : NSObject

- (id)initWithURL:(NSURL *)itemURL;
- (id)initWithRequest:(NSMutableURLRequest *)request;
- (void)start;

@property (nonatomic, strong) NSString *HTTPMethod;
@property (nonatomic, copy) AFSuccessBlock successBlock;
@property (nonatomic, copy) AFFailureBlock failureBlock;

@end
