//
//  ZSLEncrypt.m
//  ZSLCommonLib
//
//  Created by zhoushaolong on 15/10/8.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import "ZSLEncrypt.h"
#import "NSData+PXTAES.h"

@implementation ZSLEncrypt


#pragma mark -- AES
+(NSData *)encryptAESData:(NSString*)string app_key:(NSString*)key
{
    //将nsstring转化为nsdata
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    //使用密码对nsdata进行加密
    NSData *encryptedData = [data AES128EncryptWithKey:key];
    
    //base64转码
    NSString *string64 = [GTMBase64 stringByEncodingData:encryptedData];
    NSData *resultData = [string64 dataUsingEncoding:NSUTF8StringEncoding];
    return resultData;
}


//将带密码的data转成data
+ (NSData*)decryptAESData:(NSData*)data app_key:(NSString*)key;
{
    //base64解码
    NSString *base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSData *encodeData = [GTMBase64 decodeString:base64String];
    
    //使用密码对data进行解密
    NSData *decryData = [encodeData AES128DecryptWithKey:key];
    return decryData;
}

@end
