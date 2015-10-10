//
//  ReqBaseModel.h
//  ZSLCommonLib
//
//  Created by zhoushaolong on 15/9/29.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import "JSONModel.h"
#import "RspBaseModel.h"
#import "NSString+NetToolSet.h"
#import "CommonMacro.h"
#import "ZSLEncrypt.h"
#import "ZSLLibMacro.h"
#import "TipString.h"

typedef NSString* HttpMethod;

#define HTTP_METHOD_POST		@"POST"
#define HTTP_METHOD_GET			@"GET"
#define HTTP_METHOD_PUT         @"PUT"
#define HTTP_METHOD_DELETE      @"DELETE"

#define HTTP_TIMEOUT			60  // 默认超时时间

typedef NS_ENUM(int, ResponseDataType){
    ResponseDataType_Json = 0,
    ResponseDataType_XML
};

@interface ReqBaseModel : JSONModel

#pragma mark - common fun
/**
 *  返回接口名
 *
 *  @return 不实现 nil
 */
- (NSString *)serverInterfaceName;

/**
 *  请求地址 必须实现 否则返回默认地址
 *
 *  @return
 */
- (NSURL *)requestURL;

/**
 *  HttpMethod
 *
 *
 *  @return HttpMethod  default is GET
 */
-(HttpMethod)httpMethod;

/**
 *  response model class
 *
 *
 *  @return class
 */
-(Class)responseModelClass;

/**
 *  post http body
 *
 *  @return postData
 */
-(NSData*)postHttpBody;

/**
 *  postHttpString
 *
 *  @param
 *
 *  @return
 */
-(NSString*)postHttpString;

/**
 *  responseDataType
 *
 *  @return responseDataType
 */
-(ResponseDataType)responseDataType;

/**
 *  附加信息
 *
 *  @return
 */
-(NSMutableDictionary*)userInfoDictionary;

/// 是否需要解密
-(NSData*)decodeResponseData:(NSData*)responseData;

//添加需要忽略上传的属性
+ (NSArray*)ignorePorpertyNames;

#pragma mark - printLog
-(void)printRequestSuccess;

-(void)printRequestError:(NSError*)error;

-(void)printResonseData:(NSData*)data;

#pragma mark - for old kept
//相应的类型，默认为空
- (NSString *)responseClassName;

//入参转化为字典
-(NSMutableDictionary*)toMutableDictionary;

@end
