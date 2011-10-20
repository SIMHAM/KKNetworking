//
//  KKNetworking.h
//  KKNetworking
//
//  Created by Kolin Krewinkel on 10.19.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KKNetworkingOperation.h"

@interface KKNetworking : NSObject

@property (nonatomic, readonly) NSUInteger runningOperations;
@property (nonatomic, strong, readonly) NSMutableSet *operations;

+ (KKNetworking *)sharedNetworkingEngine;

@end
