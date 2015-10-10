//
//  jsonResponse.m
//  EHealth
//
//  Created by zhoushaolong on 14-11-18.
//  Copyright (c) 2014年 focuschina. All rights reserved.
//

#import "jsonResponse.h"
#import "JSONModel.h"

@implementation jsonResponse

+ (jsonResponse *)initWithResponseDic:(NSDictionary *)rsp requestType:(Class)reqTypeClass
{
    if (rsp == nil) {
        return nil;
    }
    jsonResponse *response = [[jsonResponse alloc] init];
    if ([rsp isKindOfClass:[NSDictionary class]]) {
        response.code = [rsp[kErrorCode] integerValue];
        response.msg = rsp[kErrorMsg];
        response.resultData = rsp[kResponse];
        if (reqTypeClass) {
            NSError *error;
            response.instanceModel = [[reqTypeClass alloc] initWithDictionary:response.resultData error:&error];
            if (error) {
                NSLog(@"jsonResponse %@",error);
            }
        }
        
    }
    response.originalData = rsp;
    return response;
}

+ (jsonResponse *)initWithResponseDic:(NSDictionary *)rsp
{
    return [[self class] initWithResponseDic:rsp requestType:nil];
}

+ (jsonResponse *)initWithResponseString:(NSString *)responseString
{
    return [[self class] initWithResponseString:responseString requestType:nil];
}

+ (jsonResponse *)initWithResponseData:(NSData *)responseData
{
    return [[self class] initWithResponseData:responseData requestType:nil];
}

+ (jsonResponse *)initWithResponseString:(NSString *)responseString requestType:(Class)reqTypeClass
{
    NSDictionary *dic = [responseString mutableObjectFromJSONString];
    return [[self class] initWithResponseDic:dic requestType:reqTypeClass];
}

+ (jsonResponse *)initWithResponseData:(NSData *)responseData requestType:(Class)reqTypeClass
{
    NSDictionary *dic = [responseData mutableObjectFromJSONData];
    return [[self class] initWithResponseDic:dic requestType:reqTypeClass];
}

- (BOOL)isSuccess
{
    return _code == 1;  //1表示成功
}

- (BOOL)isReLogin{
    return (HttpStatusCodeUnlogin == _code || HttpStatusCodeLoginError == _code);   // 用户未登录
}

- (NSString *)msg
{
    if (_msg.length == 0) {
        return k_Msg_NetWorkErr;
    }
    else {
        return _msg;
    }
    
}

@end
