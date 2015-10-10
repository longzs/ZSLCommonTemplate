//
//  TipString.h
//  ZSLCommonLib
//
//  Created by zhoushaolong on 15/8/28.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#ifndef ZSLCommonLib_TipString_h
#define ZSLCommonLib_TipString_h

#pragma mark - 基本
#define k_Btn_Confrim   @"确定"       //按钮标题－确定
#define k_Btn_Cancel    @"取消"       //按钮标题－取消
#define k_Btn_Close     @"关闭"       //按钮标题－关闭
#define k_Btn_Know      @"知道了"      //按钮标题－知道了
#define k_Title_Alert   @"温馨提示"     //提示框标题


#pragma mark - 网络
#define k_Msg_NetWorkErr        @"网络错误，请稍候再试"       //网络错误

#pragma mark - 检查新版本
#define k_Msg_CheckVersion_IsNew        @"已经是最新版本" //已经是最新
#define k_Msg_CheckVersion_Error        @"检查新版本失败，请稍候再试"   //出错
#define k_Msg_CheckVersion_HasNewVerion @"发现新版本"    //发现新版本的提示首段

#pragma mark - 校验
#pragma mark / 身份证校验
#define k_Msg_Valid_IdCard_Empty        @"身份证号不能为空"
#define k_Msg_Valid_IdCard_Good         @"身份证验证通过!"
#define k_Msg_Valid_IdCard_LenthErr     @"身份证号码位数不对!"
#define k_Msg_Valid_IdCard_BirthErr     @"身份证号码出生日期超出范围或含有非法字符!"
#define k_Msg_Valid_IdCard_ValidErr     @"身份证号码校验错误!"
#define k_Msg_Valid_IdCard_LocalErr     @"身份证号码在地区处非法!"

#endif
