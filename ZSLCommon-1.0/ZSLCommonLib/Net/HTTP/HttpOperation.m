//
//  HttpOperation.m
//  ZSLCommonLib
//
//  Created by zhoushaolong on 15/9/29.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import "HttpOperation.h"

@implementation HttpOperation

-(BOOL)isNetWorkOK{
    return nil == self.httpError;
}


+(HttpOperation*)httpOperationWithRequestModel:(ReqBaseModel*)reqModel responseBlock:(ZSLHttpCallBack)responseBlock{
    HttpOperation *ho = [[HttpOperation alloc] init];
    ho.reqModel = reqModel;
    ho.responseBlock = responseBlock;
    return ho;
}

@end
