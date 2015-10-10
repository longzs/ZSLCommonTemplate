//
//  NSString+NetToolSet.h
//  EHealthCommon
//
//  Created by zhoushaolong on 15/8/12.
//  Copyright (c) 2015年 FocusChina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NetToolSet)

#pragma mark - net
/**
 *  将unicode 转换为 中文
 */
-(NSString*)translateUnicode;

/**
 *  将字符串中得不能识别字符替换为空字符
 *
 *  @param invalidStr 不能识别字符
 *
 *  @return 替换后的的字符串
 */
-(NSString*)replaceInvalidCharactersToEmpty:(NSString*)invalidStr;

/**
 *  是否空字符串
 *
 *  @return YES is empty other Non
 */
-(BOOL)isEmptyString;

#pragma mark - md5 

/**
 *  对自生进行MD5加密
 *
 *
 *  @return MD5后的字符串
 */
- (NSString *) md5Encrypt;

/**
 *  对一个文件内容进行MD5加密
 *
 *  @param file 文件路径
 *
 *  @return MD5后的字符串
 */
+ (NSString *) md5ForFileContent:(NSString *)file;

/**
 *  对NSData的内容进行MD5加密
 *
 *  @param data 原数据
 *
 *  @return MD5后的字符串
 */
+ (NSString *) md5ForData:(NSData *)data;

#pragma mark - class method
/**
 *  将unicode 转换为 中文
 */
+(NSString*)translateUnicodeStr:(NSString*)uniStr;

@end
