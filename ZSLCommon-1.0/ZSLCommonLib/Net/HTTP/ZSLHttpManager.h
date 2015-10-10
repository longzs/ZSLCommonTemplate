//
//  ZSLHttpManager.h
//  ZSLCommonLib
//
//  Created by zhoushaolong on 15/9/29.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpOperation.h"

#define HttpReqCancel(cancelId) [[EHHttpManager sharedInstance] CancelRequestByID:cancelId]

/**
 *  http公共返回码处理
 *
 *  @param rsOperation
 *
 *  @return YES 继续rsponse，NO 中断
 */
typedef BOOL (^CommonProcessCallBack) (HttpOperation* rsOperation);

@interface ZSLHttpManager : NSObject
@property(nonatomic, copy)NSString* baseURLStr;
@property(nonatomic, copy)CommonProcessCallBack commonProcess;

DEFINE_SINGLETON_FOR_HEADER(ZSLHttpManager)

// 返回reqID
-(int)SendHttpMsg:(HttpOperation*)SendMsg httpHethod:(HttpMethod)method;

// 返回reqID
-(int)SendHttpMsg_Get:(HttpOperation*)SendMsg;

// 返回reqID  直接发送post 请求
-(int)SendHttpMsg_Post:(HttpOperation*)SendMsg;

//按顺序执行的请求 目前用户发送  返回reqID
-(int)SendSingRequest:(HttpOperation*)SendMsg;

//发送上传请求，返回req id
- (int)sendUploadRequest:(HttpOperation*)sendMsg;

//取消
-(void)CancelRequestByID:(int)ReqId;
-(void)cancelAllRequest;

+(HttpOperation*)findOperationByTag:(int)reqID;

@end
