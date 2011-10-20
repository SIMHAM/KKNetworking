//
//  KKNetworkingOperation.h
//  KKNetworking
//
//  Created by Kolin Krewinkel on 10.19.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    KKNetworkingOperationReturnTypeJSON,
    KKNetworkingOperationReturnTypeXML,
    KKNetworkingOperationReturnTypeImage,
    KKNetworkingOperationReturnTypeMovie
} KKNetworkingOperationReturnType;

@interface KKNetworkingOperation : NSObject

@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSURLRequest *request;
@property (nonatomic, strong) NSHTTPURLResponse *response;
@property (nonatomic) KKNetworkingOperationReturnType returnType;

#pragma mark - Initialization

- (id)initWithRequest:(NSURLRequest *)request;
+ (id)operationWithRequest:(NSURLRequest *)request;

#pragma mark - Starting Requests

- (void)start;

@end
