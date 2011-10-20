//
//  KKNetworking.m
//  KKNetworking
//
//  Created by Kolin Krewinkel on 10.19.11.
//  Copyright (c) 2011 Kolin Krewinkel. All rights reserved.
//

#import "KKNetworking.h"
#import "KKNetworkingOperation.h"

@interface KKNetworking ()

- (void)_addOperation:(KKNetworkingOperation *)operation start:(BOOL)start;
- (void)_startOperation:(KKNetworkingOperation *)operation;

@end

@implementation KKNetworking
@synthesize operations = _operations;
@synthesize runningOperations = _runningOperations;

#pragma mark - Singleton

+ (KKNetworking *)sharedNetworkingEngine
{
    static KKNetworking *sharedNetworkingEngine;    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedNetworkingEngine = [[[self class] alloc] init];
    });
    
    return sharedNetworkingEngine;
}

#pragma mark - Initialization

- (id)init
{
    if ((self = [super init])) {
        _operations = [[NSMutableSet alloc] init];
    }
    
    return self;
}

#pragma mark - Public Request Starting

- (void)requestURL:(NSURL *)url
{
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30];
    KKNetworkingOperation *operation = [[KKNetworkingOperation alloc] initWithRequest:request];
    [self _addOperation:operation start:YES];
}

#pragma mark - Private Request Starting

- (void)_addOperation:(KKNetworkingOperation *)operation start:(BOOL)start
{
    if (!operation)
        return;
    
    [_operations addObject:operation];
    
    if (start)
        [self _startOperation:operation];
}

- (void)_startOperation:(KKNetworkingOperation *)operation
{
    [operation start];
}

@end
