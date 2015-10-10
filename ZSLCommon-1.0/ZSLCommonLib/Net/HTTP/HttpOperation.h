//
//  HttpOperation.h
//  ZSLCommonLib
//
//  Created by zhoushaolong on 15/9/29.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReqBaseModel.h"
#import "ReqUploadModel.h"
#import "jsonResponse.h"

@class HttpOperation;


typedef void (^ZSLHttpCallBack) (HttpOperation* httpOperation);

@interface HttpOperation : NSObject

@property(nonatomic, assign)int    requestId;
@property(nonatomic, strong)ReqBaseModel* reqModel;
@property(nonatomic, strong)NSData*       responseData;

//返回的json模型
@property(nonatomic, strong)jsonResponse* rspJsonData;

@property(nonatomic, copy)ZSLHttpCallBack  responseBlock;

//  http 返回码(eg:200)
@property(nonatomic, strong)NSError*             httpError;


-(BOOL)isNetWorkOK;

+(HttpOperation*)httpOperationWithRequestModel:(ReqBaseModel*)reqModel responseBlock:(ZSLHttpCallBack)responseBlock;

@end
