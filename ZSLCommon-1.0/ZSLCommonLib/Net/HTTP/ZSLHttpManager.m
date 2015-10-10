//
//  ZSLHttpManager.m
//  ZSLCommonLib
//
//  Created by zhoushaolong on 15/9/29.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import "ZSLHttpManager.h"
#import "AFNetworking.h"


@interface ZSLAFHTTPResponseSerializer : AFJSONResponseSerializer
@property(nonatomic, strong)NSNumber* tag;
@end

@implementation ZSLAFHTTPResponseSerializer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain",nil];
    }
    return self;
}

#pragma mark - AFURLResponseSerializationDelegate
- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error{
    HttpOperation* hop = [ZSLHttpManager findOperationByTag:self.tag.intValue];
    NSData* decodeData = [hop.reqModel decodeResponseData:data];
    if (hop && nil != decodeData) {
        return [super serializerResponseData:response data:decodeData error:error];
    }
    return [super serializerResponseData:response data:data error:error];
}
@end

@interface ZSLAFHTTPRequestOperation : AFHTTPRequestOperation
@property(nonatomic, strong)NSNumber* tag;

@end

@implementation ZSLAFHTTPRequestOperation
@synthesize tag;
@end

@interface ZSLAFHttpOperationManager : AFHTTPRequestOperationManager

-(ZSLAFHTTPRequestOperation*)HttpRequestWithHttpOperation:(HttpOperation*)hop;

-(void)sentOperation:(ZSLAFHTTPRequestOperation*)operation
       httpOperation:(HttpOperation*)hop;
@end

@implementation ZSLAFHttpOperationManager

-(ZSLAFHTTPRequestOperation*)HttpRequestWithHttpOperation:(HttpOperation*)hop{
    
    NSMutableURLRequest *request = nil;
    NSString* urlstr = [[hop.reqModel requestURL] absoluteString];
    
    //上传类型
    if ([hop isKindOfClass:[ReqUploadModel class]]) {
        
//        NSDictionary *parameters = hop.requestHeader;
//        //上传的接口
//        NSString* urlstring = urlstr;
//        //分界线的标识符
//        NSString *TWITTERFON_FORM_BOUNDARY = @"0xKhTmLbOuNdArY";
//        
//        //根据url初始化request
//        request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlstring]
//                                          cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
//                                      timeoutInterval:10];
//        //分界线 --AaB03x
//        NSString *MPboundary=[[NSString alloc]initWithFormat:@"--%@",TWITTERFON_FORM_BOUNDARY];
//        //结束符 AaB03x--
//        NSString *endMPboundary=[[NSString alloc]initWithFormat:@"%@--",MPboundary];
//        
//        NSData *data = hop.uploadFile;
//        
//        //http body的字符串
//        NSMutableString *body=[[NSMutableString alloc]init];
//        //参数的集合的所有key的集合
//        NSArray *keys= [parameters allKeys];
//        //遍历keys
//        for(int i=0;i<[keys count];i++)
//        {
//            //得到当前key
//            NSString *key=[keys objectAtIndex:i];
//            //添加分界线，换行
//            [body appendFormat:@"%@\r\n",MPboundary];
//            //添加字段名称，换2行
//            [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",key];
//            //添加字段的值
//            [body appendFormat:@"%@\r\n",[parameters objectForKey:key]];
//            
//        }
//        
//        NSMutableData *myRequestData= [NSMutableData data];
//        
//        if (data) {
//            ////添加分界线，换行
//            [body appendFormat:@"%@\r\n",MPboundary];
//            //声明pic字段，文件名为boris.png
//            [body appendFormat:@"Content-Disposition: form-data; name=\"file\"; filename=\"boris.png\"\r\n"];
//            //声明上传文件的格式
//            [body appendFormat:@"Content-Type: image/jpg\r\n\r\n"];
//            //声明结束符：--AaB03x--
//            NSString *end=[[NSString alloc]initWithFormat:@"\r\n%@",endMPboundary];
//            //声明myRequestData，用来放入http body
//            
//            //将body字符串转化为UTF8格式的二进制
//            [myRequestData appendData:[body dataUsingEncoding:NSUTF8StringEncoding]];
//            //将image的data加入
//            [myRequestData appendData:data];
//            //加入结束符--AaB03x--
//            [myRequestData appendData:[end dataUsingEncoding:NSUTF8StringEncoding]];
//        }
//        
//        //设置HTTPHeader中Content-Type的值
//        NSString *content=[[NSString alloc]initWithFormat:@"multipart/form-data; boundary=%@",TWITTERFON_FORM_BOUNDARY];
//        //设置HTTPHeader
//        [request setValue:content forHTTPHeaderField:@"Content-Type"];
//        //设置Content-Length
//        [request setValue:[NSString stringWithFormat:@"%d", (int)[myRequestData length]] forHTTPHeaderField:@"Content-Length"];
//        [request setHTTPMethod:@"POST"];
//        [request setHTTPBodyStream:[NSInputStream inputStreamWithData:myRequestData]];
        
    }
    //数据类型
    else {
        if ([[hop.reqModel httpMethod] isEqualToString:HTTP_METHOD_GET]) {
            request = [self.requestSerializer requestWithMethod:HTTP_METHOD_GET URLString:[[NSURL URLWithString:urlstr relativeToURL:self.baseURL] absoluteString] parameters:[hop.reqModel toDictionary] error:nil];
        }
        else if([[hop.reqModel httpMethod] isEqualToString:HTTP_METHOD_POST]){
            request = [self.requestSerializer requestWithMethod:HTTP_METHOD_POST URLString:[[NSURL URLWithString:urlstr relativeToURL:self.baseURL] absoluteString] parameters:nil error:nil];
        }
        else {
            // 暂时不考虑 put 或者 delete 类型后续在做扩展
            request = [NSMutableURLRequest requestWithURL:[hop.reqModel requestURL]];
        }
        [request setHTTPBody:[hop.reqModel postHttpBody]];
    }
    
    
    //[request setValue:@"text/html" forHTTPHeaderField:@"Content-Type"];
    
    ZSLAFHTTPRequestOperation *operation = [[ZSLAFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [ZSLAFHTTPResponseSerializer serializer];
    operation.shouldUseCredentialStorage = self.shouldUseCredentialStorage;
    operation.credential = self.credential;
    operation.securityPolicy = self.securityPolicy;
    
    return operation;
}

-(void)sentOperation:(ZSLAFHTTPRequestOperation*)operation
       httpOperation:(HttpOperation*)hop{
    
    [self.operationQueue addOperation:operation];
}
@end

typedef void (^afSuccessCallBack)(AFHTTPRequestOperation *operation, id responseObject);

typedef void (^afFailureCallBack)(AFHTTPRequestOperation *operation, NSError *error);

static NSMutableDictionary* g_dicOperations = nil;

@interface ZSLHttpManager(){
    NSInteger iCmd;
    NSLock* lock_;
}
@property(nonatomic, strong)ZSLAFHttpOperationManager* operationManager;


-(void)insertOperation:(HttpOperation*)hop;
-(void)deleteOperationByTag:(int)iTag;

@end

@implementation ZSLHttpManager

DEFINE_SINGLETON_FOR_CLASS(ZSLHttpManager)

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.operationManager = [ZSLAFHttpOperationManager manager];
        self.operationManager.requestSerializer.timeoutInterval = HTTP_TIMEOUT;
        //self.operationManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];//@"application/x-www-form-urlencoded",
        [g_dicOperations removeAllObjects];
        g_dicOperations = [[NSMutableDictionary alloc] initWithCapacity:0];
        lock_ = [[NSLock alloc] init];
    }
    return self;
}

// 返回reqID
-(int)SendHttpMsg_Get:(HttpOperation*)SendMsg{
    
    return [self SendHttpMsg:SendMsg httpHethod:HTTP_METHOD_GET];
}

-(int)SendHttpMsg_Post:(HttpOperation*)SendMsg{
    return [self SendHttpMsg:SendMsg httpHethod:HTTP_METHOD_POST];
}

// 返回reqID
-(int)SendHttpMsg:(HttpOperation*)SendMsg httpHethod:(HttpMethod)method{
    
    if (!SendMsg) {
        return -1;
    }
    __weak __typeof(self)weakSelf = self;
    afSuccessCallBack success = ^(AFHTTPRequestOperation *operation, id responseObject){
        ZSLAFHTTPRequestOperation* ef = (ZSLAFHTTPRequestOperation*)operation;
        
        HttpOperation* hop = [ZSLHttpManager findOperationByTag:ef.tag.intValue];
        
#if k_RecordOperationTime
        hop.endDates = [NSDate date];
        NSTimeInterval timeInterval = [hop.endDates timeIntervalSinceDate:hop.beginDates];
        hop.durationDates = [NSString stringWithFormat:@"%.3f", timeInterval];
        NSLog(@"Method = %@, 开始 = %@, 结束 = %@, 耗时 = %@", hop.serverMethod, [EHCommonUtils fomartForDate:hop.beginDates withformat:@"HH:mm:ss.SSS"], [EHCommonUtils fomartForDate:hop.endDates withformat:@"HH:mm:ss.SSS"], hop.durationDates);
#endif
        
        if (hop) {
            
            if (ResponseDataType_Json == [hop.reqModel responseDataType]) {
                Class className = [hop.reqModel responseModelClass];
                hop.rspJsonData = [jsonResponse initWithResponseDic:responseObject requestType:className];
            }
            else{
                hop.responseData = [NSMutableData dataWithData:ef.responseData];
            }
            
            [hop.reqModel printResonseData:responseObject];
            
            BOOL bContinue = YES;
            if (self.commonProcess) {
                bContinue = self.commonProcess(hop);
            }
            if (hop.responseBlock && bContinue) {
                hop.responseBlock(hop);
            }
            [weakSelf deleteOperationByTag:ef.tag.intValue];
        }
    };
    
    afFailureCallBack failure = ^(AFHTTPRequestOperation *operation, NSError *error){
        ZSLAFHTTPRequestOperation* ef = (ZSLAFHTTPRequestOperation*)operation;
        
        HttpOperation* hop = [ZSLHttpManager findOperationByTag:ef.tag.intValue];
        if (hop) {
            hop.httpError = error;
            
            if (hop.responseBlock) {
                hop.responseBlock(hop);
            }
            
            [hop.reqModel printRequestError:error];
            [weakSelf deleteOperationByTag:ef.tag.intValue];
        }
    };
    
    [lock_ lock];
    iCmd++;
    [lock_ unlock];
    [SendMsg setRequestId:(int)iCmd];
    
    ZSLAFHTTPRequestOperation* oper = [self.operationManager HttpRequestWithHttpOperation:SendMsg];
    [oper setCompletionBlockWithSuccess:success failure:failure];
    [oper setTag:@(iCmd)];
    [((ZSLAFHTTPResponseSerializer*)oper.responseSerializer) setTag:@(iCmd)];
#if k_RecordOperationTime
    SendMsg.beginDates = [NSDate date];
#endif
    [self insertOperation:SendMsg];
    
    [self.operationManager sentOperation:oper httpOperation:SendMsg];
    
    [SendMsg.reqModel printRequestSuccess];
    return (int)iCmd;
}

-(NSString*)msgUrlRequest:(HttpOperation*)sendMsg{
    NSString* ret = [[sendMsg.reqModel requestURL] absoluteString];
    return ret;
}

-(int)SendSingRequest:(HttpOperation*)SendMsg
{
    int msgTag = -1;
    if (nil == SendMsg) {
        
        return msgTag;
    }
    //////
    
    return msgTag;
}

- (int)sendUploadRequest:(HttpOperation *)sendMsg
{
    return [self SendHttpMsg:sendMsg httpHethod:HTTP_METHOD_POST];
}

-(void)insertOperation:(HttpOperation*)hop{
    [lock_ lock];
    [g_dicOperations setObject:hop forKey:@(hop.requestId)];
    [lock_ unlock];
}

-(void)deleteOperationByTag:(int)iTag{
    
    if ([g_dicOperations objectForKey:@(iTag)]) {
        [lock_ lock];
        [g_dicOperations removeObjectForKey:@(iTag)];
        [lock_ unlock];
    }
}

+(HttpOperation*)findOperationByTag:(int)reqID{
    
    HttpOperation* hop = [g_dicOperations objectForKey:@(reqID)];
    return hop;
}

#define kCancelRequestByID(asiQueue, reqID) for (int i = 0; i < [[asiQueue operations] count]; i++) {\
ASIHTTPRequest *Req = [[asiQueue operations] objectAtIndex:i];\
if (reqID == Req.tag) {\
[Req cancel];\
bCancel = YES;\
break;\
}\
}

-(void)cancelRequestFromQueuqByID:(int)reqID
{
    if (nil != [g_dicOperations objectForKey:[NSNumber numberWithInt:reqID]]) {
        [lock_ lock];
        [g_dicOperations removeObjectForKey:[NSNumber numberWithInt:reqID]];
        [lock_ unlock];
    }
}


-(void)CancelRequestByID:(int)ReqId{
    
    [self cancelRequestFromQueuqByID:ReqId];
}

-(void)cancelAllRequest
{
    [lock_ lock];
    [g_dicOperations removeAllObjects];
    [self.operationManager.operationQueue cancelAllOperations];
    [lock_ unlock];
}

@end
