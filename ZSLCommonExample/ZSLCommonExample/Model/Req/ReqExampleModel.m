//
//  ReqExampleModel.m
//  ZSLCommonExample
//
//  Created by zhoushaolong on 15/10/9.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import "ReqExampleModel.h"

@implementation ReqExampleModel

-(NSString*)serverInterfaceName{
    return k_URL_terminalSignIn;
}

-(NSURL*)requestURL{
    return [NSURL URLWithString:k_URL_Mainifest];
}

-(NSString*)postHttpString{
    NSString* jsonStr = [self toJSONString];
    NSString* encodeStr = [NSString stringWithFormat:@"productId=%@&pltId=%@&version=%@&paramMethod=%@&paramContent=%@", k_ProductId_xxx,k_PlatID_IOS,VERSION_APP_STRING,[self serverInterfaceName], nil==jsonStr?@"":jsonStr];
    return encodeStr;
}

-(void)printRequestSuccess{
    DLog(@"\n----HttpRequest url = %@\r\n body = %@", [self requestURL], [self postHttpString]);
}

@end
