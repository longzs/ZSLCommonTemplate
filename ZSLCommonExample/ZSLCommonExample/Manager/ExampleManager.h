//
//  ExampleManager.h
//  ZSLCommonExample
//
//  Created by zhoushaolong on 15/10/9.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import <ZSLCommonLib/ZSLCommonLib.h>
#import "ReqExampleModel.h"

@interface ExampleManager : BaseManager

DEFINE_SINGLETON_FOR_HEADER(ExampleManager);

-(int)terminalSignIn:(ReqExampleModel*)model
              success:(processSuccess)sucBlock
               failed:(processFailed)falBlock;

@end
