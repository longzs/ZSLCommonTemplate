//
//  ZSLLibMacro.h
//  ZSLCommonLib
//
//  Created by zhoushaolong on 15/8/27.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#ifndef ZSLCommonLib_ZSLLibMacro_h
#define ZSLCommonLib_ZSLLibMacro_h

#define weakSelf(wSelf)    __weak __typeof(self)wSelf = self

#pragma mark - 工程设置
#define kUseAESEncode        1          //使用AES加密网络数据
#define kAESKey     @"jiankangwuyouabc" //ASE加密算法的Key

#pragma mark - 平台id
// IOS 平台ID
#define k_PlatID_IOS                     @"01"

#define k_ProductId_xxx                     @"01"

//测试服务器
#ifndef k_Server_Test
#define k_Server_Test   0
#endif

//是否使用写死的地址，如果不是用则使用配置文件
#ifndef k_UseLocalUrl
#define k_UseLocalUrl 0
#endif

#if     k_Server_Test
#define k_URL_Mainifest     @"http://s.jiankang51.cn/HSPS/svc3Request"  //p版
#else
#define k_URL_Mainifest         @"http://s.jiankang51.cn/HSPS/svc3Request"
#endif

typedef NSString* ServerInterfaceName;

//用户打开终端时，由终端调用该接口
#define k_URL_terminalSignIn             @"terminalSignIn"

//身份信息验证
#define k_URL_IsUserRegister              @"isUserRegister"

/* 网络 */
//状态码
typedef NS_ENUM(NSInteger, HttpStatusCode)
{
    //成功
    HttpStatusCodeSuccess = 1,
    
    //失败
    HttpStatusCodeNetworkErr = -99999,
    
    //未成年人
    HttpStatusCodeNoAdult = 1035,
    
    //查询排队不支持
    HttpStatusCodeCheckQueueUnsupport = 1036,
    
    //查询排队超过工作时间
    HttpStatusCodeCheckQueueOutTime = 1037,
    
    //用户未登录，登陆超时
    HttpStatusCodeUnlogin = 9004,
    
    //登录异常，被挤下线
    HttpStatusCodeLoginError = 9005
    
};


//医院支持的支付类型
typedef NS_OPTIONS(NSUInteger, EOptionsType) {
    EOptionsType1                   = 0,        //
    EOptionsType2                   = 1 << 0,   //
    EOptionsType3                   = 1 << 1,   //
    EOptionsType4                   = 1 << 2,   //
    EOptionsType5                   = 1 << 3,   //
    EOptionsType6                   = 1 << 4,   //
};

#endif
