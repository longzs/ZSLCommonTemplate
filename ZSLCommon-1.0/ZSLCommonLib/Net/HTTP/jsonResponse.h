//
//  jsonResponse.h
//  EHealth
//
//  Created by zhoushaolong on 14-11-18.
//  Copyright (c) 2014年 focuschina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONKit.h"
#import "ZSLLibMacro.h"
#import "TipString.h"

#define kErrorCode      @"rspCode"
#define kErrorMsg       @"rspMsg"
#define kResponse       @"rspData"

/**
 *  网络请求响应类
 */

@interface jsonResponse : NSObject

/**
 *  1表示成功，可自由配置
 */
@property (assign, nonatomic) NSInteger code;
/**
 *  执行结果描述
 */
@property (strong, nonatomic) NSString *msg;
/**
 *  从网络返回数据通过JSONKit格式化后得到的原始数据
 */
@property (strong, nonatomic) id originalData;
/**
 *  根据业务解析获得的实际业务数据
 *  {"msg":"执行成功","code":1,"rstInfo":{"..."}}
 */
@property (strong, nonatomic) NSDictionary *resultData;
/**
 *  根据业务解析获得的实际业务数据JSONModel对象
 *
 */
@property (strong, nonatomic) id instanceModel;

/**
 *  从请求返回的字典初始化对象
 *
 *  @param responseDic 网络请求回来的字典
 *
 *  @return 网络响应对象
 */
+ (jsonResponse *)initWithResponseDic:(NSDictionary *)responseDic;

/**
 *  从请求返回的字符串初始化对象
 *
 *  @param responseString 网络请求回来的responseString
 *
 *  @return 网络响应对象
 */
+ (jsonResponse *)initWithResponseString:(NSString *)responseString;

/**
 *  从请求返回的data初始化对象
 *
 *  @param responseData 网络请求回来的responseData
 *
 *  @return 网络响应对象
 */
+ (jsonResponse *)initWithResponseData:(NSData *)responseData;

/**
 *  从请求返回的字典初始化对象
 *
 *  @param responseDic 网络请求回来的字典
 *
 *  @return 网络响应对象
 */
+ (jsonResponse *)initWithResponseDic:(NSDictionary *)responseDic requestType:(Class)reqTypeClass;

/**
 *  从请求返回的字符串初始化对象
 *
 *  @param responseString 网络请求回来的responseString
 *
 *  @return 网络响应对象
 */
+ (jsonResponse *)initWithResponseString:(NSString *)responseString requestType:(Class)reqTypeClass;

/**
 *  从请求返回的data初始化对象
 *
 *  @param responseData 网络请求回来的responseData
 *
 *  @return 网络响应对象
 */
+ (jsonResponse *)initWithResponseData:(NSData *)responseData requestType:(Class)reqTypeClass;

/**
 *  请求业务是否成功执行
 *
 *  @return YES：执行成功，NO：执行失败
 */
- (BOOL)isSuccess;

/**
 *  是否需要重新登录
 *
 *  @return YES：执行成功，NO：执行失败
 */
- (BOOL)isReLogin;


@end
