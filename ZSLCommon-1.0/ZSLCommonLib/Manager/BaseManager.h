//
//  BaseManager.h
//  ZSLCommonLib
//
//  Created by zhoushaolong on 15/8/27.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpOperation.h"

//  业务处理失败或成功的回调
//  按照目前服务器交互 返回的数据格式为 jsonResponse
typedef void (^processCallBack)(id responseData);
typedef void (^processSuccess)(jsonResponse *responseData);
typedef void (^processFailed)(HttpStatusCode errCode, NSString *message);

//整合后的新回调
typedef void (^ProcessFinish)(HttpStatusCode errCode,jsonResponse *responseData);

@interface BaseManager : NSObject

-(int)sendHttpRequest:(ReqBaseModel*)reqModel
              success:(processSuccess)successBlock
               failed:(processFailed)failedBlock;

-(int)sendHttpRequest:(ReqBaseModel*)reqModel
               finish:(ProcessFinish)finishBlock;

@end
