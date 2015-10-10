//
//  ZSLEncrypt.h
//  ZSLCommonLib
//
//  Created by zhoushaolong on 15/10/8.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTMBase64.h"

@interface ZSLEncrypt : NSObject

#pragma mark - AES

//将string转成带密码的data
+ (NSData *)encryptAESData:(NSString*)string app_key:(NSString*)key;

//将带密码的data转成data
+ (NSData*)decryptAESData:(NSData*)data app_key:(NSString*)key;

@end
