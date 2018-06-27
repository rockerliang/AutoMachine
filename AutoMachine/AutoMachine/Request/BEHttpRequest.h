//
//  BEHttpRequest.h
//  BesTVKit
//
//  Created by Rocker on 2018/6/25.
//  Copyright © 2018年 Rocker. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessBlock)(id responseObject);
typedef void (^FailureBlock)(NSString *error);

@interface BEHttpRequest : NSObject


//GET网络请求
+ (void)getWithURL:(NSString *)url Params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure;

//POST
+ (void)PostWithURL:(NSString *)url Params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure;


@end
