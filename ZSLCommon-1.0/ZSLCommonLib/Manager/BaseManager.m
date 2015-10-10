//
//  BaseManager.m
//  ZSLCommonLib
//
//  Created by zhoushaolong on 15/8/27.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import "BaseManager.h"
#import "ZSLHttpManager.h"

@interface BaseManager()
- (ZSLHttpCallBack)callBackWithprocessFinish:(ProcessFinish)finishBlock
                    additionalProcessSuccess:(ZSLHttpCallBack)addtionalBlock;

- (ZSLHttpCallBack)callBackWithSuccess:(processSuccess)success
                    failed:(processFailed)failed;

-(int)sendHttpOperation:(ReqBaseModel*)reqModel
                 finish:(ZSLHttpCallBack)httpBlock;
@end

@implementation BaseManager

- (ZSLHttpCallBack)callBackWithprocessFinish:(ProcessFinish)finishBlock
               additionalProcessSuccess:(ZSLHttpCallBack)addtionalBlock{
    
    ZSLHttpCallBack callBack = ^(HttpOperation* hop) {
        
        //请求成功
        if ([hop isNetWorkOK]) {
            
            //成功返回码
            if ([hop.rspJsonData isSuccess]) {
                
                //额外的处理
                if (addtionalBlock) {
                    addtionalBlock(hop);
                }
            }
            
            if (finishBlock) {
                finishBlock((HttpStatusCode)hop.rspJsonData.code, hop.rspJsonData);
            }
        }
        
        else{
            //网络错误
            if (finishBlock) {
                finishBlock((HttpStatusCodeNetworkErr), nil);
            }
        }
    };
    
    return callBack;
    
}

- (ZSLHttpCallBack)callBackWithSuccess:(processSuccess)success
                                failed:(processFailed)failed{
    
    ZSLHttpCallBack callBack = ^(HttpOperation* hop) {
        
        //请求成功
        if ([hop isNetWorkOK]) {
            
            //成功返回码
            if ([hop.rspJsonData isSuccess]) {
                
                if (success) {
                    success(hop.rspJsonData);
                }
            }
            else{
                if (failed) {
                    failed(hop.rspJsonData.code, hop.rspJsonData.msg);
                }
            }
        }
        
        else{
            //网络错误
            if (failed) {
                failed(HttpStatusCodeNetworkErr, k_Msg_NetWorkErr);
            }
        }
    };
    
    return callBack;
}

-(int)sendHttpRequest:(ReqBaseModel*)reqModel
              success:(processSuccess)successBlock
               failed:(processFailed)failedBlock{
    
    ZSLHttpCallBack callBack = [self callBackWithSuccess:successBlock failed:failedBlock];
    return [self sendHttpOperation:reqModel finish:callBack];
}

-(int)sendHttpRequest:(ReqBaseModel*)reqModel
               finish:(ProcessFinish)finishBlock{
    
    ZSLHttpCallBack callBack = [self callBackWithprocessFinish:finishBlock additionalProcessSuccess:nil];
    return [self sendHttpOperation:reqModel finish:callBack];
}

-(int)sendHttpOperation:(ReqBaseModel*)reqModel
                 finish:(ZSLHttpCallBack)httpBlock{
    
    HttpOperation *op = [HttpOperation httpOperationWithRequestModel:reqModel responseBlock:httpBlock];
    return [[ZSLHttpManager sharedInstance] SendHttpMsg:op httpHethod:[op.reqModel httpMethod]];
}
@end
