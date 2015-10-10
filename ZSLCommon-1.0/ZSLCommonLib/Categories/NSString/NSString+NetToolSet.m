//
//  NSString+NetToolSet.m
//  EHealthCommon
//
//  Created by zhoushaolong on 15/8/12.
//  Copyright (c) 2015年 FocusChina. All rights reserved.
//

#import "NSString+NetToolSet.h"
#import <CommonCrypto/CommonDigest.h> 


@implementation NSString (NetToolSet)

-(NSString*)translateUnicode{
    
    NSString* desc = [NSString stringWithCString:[self cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding];
    return desc;
}

-(NSString*)replaceInvalidCharactersToEmpty:(NSString*)invalidStr{
    
    if (nil == invalidStr) {
        return self;
    }
    //正则表达式   查找匹配可能出现的白空格 注:可以用正则 匹配\s 进行处理  \s 包括   [ \f\n\r\t\v?\u00a0\u1680?\u180e\u2000?\u2001\u2002?\u2003\u2004?\u2005\u2006?\u2007\u2008?\u2009\u200a?\u2028\u2029??\u202f\u205f?\u3000]. For example, /\s\w*/ matches ' bar' in "foo bar." 正则匹配相关
    
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:invalidStr options:0 error:nil];
    NSString* replaceStr = [regularExpression stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, self.length) withTemplate:@""];
    
    return replaceStr;
}

-(BOOL)isEmptyString{
    
    return 0 == self.length;
}


#pragma mark - md5
//md5 加密字符串
- (NSString *) md5Encrypt {
    
    if (0 == self.length) {
        return nil;
    }
    const char *cstr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cstr, (CC_LONG)strlen(cstr), result);
    
    return [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1],
            result[2], result[3],
            result[4], result[5],
            result[6], result[7],
            result[8], result[9],
            result[10], result[11],
            result[12], result[13],
            result[14], result[15]];
}

//md5 加密文件内容
+ (NSString *) md5ForFileContent:(NSString *)file {
    
    if( nil == file ){
        
        return nil;
    }
    
    NSData * data = [NSData dataWithContentsOfFile:file];
    
    return [self md5ForData:data];
}

//md5 加密data
+ (NSString *) md5ForData:(NSData *)data{
    
    if( !data || ![data length] ) {
        return nil;
    }
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5([data bytes], (CC_LONG)[data length], result);
    
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]];
}


#pragma mark -- class method
+(NSString*)translateUnicodeStr:(NSString*)uniStr{
    
    if (nil == uniStr) {
        return nil;
    }
    NSString* desc = [NSString stringWithCString:[uniStr cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding];
    return desc;
}

@end
