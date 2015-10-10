//
//  ExampleManager.m
//  ZSLCommonExample
//
//  Created by zhoushaolong on 15/10/9.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import "ExampleManager.h"

@implementation ExampleManager

DEFINE_SINGLETON_FOR_CLASS(ExampleManager)

-(int)terminalSignIn:(ReqExampleModel*)model
              success:(processSuccess)sucBlock
               failed:(processFailed)falBlock{
    
    return [self sendHttpRequest:model success:sucBlock failed:falBlock];
}

@end
