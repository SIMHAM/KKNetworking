//
//  KKNetworkingOperation.m
//  KKNetworking
//
//  Created by Kolin Krewinkel on 10.19.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "KKNetworkingOperation.h"

@implementation KKNetworkingOperation
@synthesize connection = _connection;
@synthesize request = _request;
@synthesize response = _response;
@synthesize returnType = _returnType;

#pragma mark - Initialization

- (id)initWithRequest:(NSURLRequest *)request
{
    if ((self = [super init])) {
        self.request = request;
    }
    
    return self;
}

+ (id)operationWithRequest:(NSURLRequest *)request
{
    __autoreleasing id operation = [[[self class] alloc] initWithRequest:request];
    return operation;
}

#pragma mark - Starting Requests

- (void)start
{
    if (!_request)
        return;
    
    _connection = [[NSURLConnection alloc] initWithRequest:_request delegate:self];
    dispatch_async(dispatch_get_main_queue(), ^{
        [_connection scheduleInRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        [_connection start];
    });
}

@end
