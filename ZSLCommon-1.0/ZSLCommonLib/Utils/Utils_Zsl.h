//
//  Utils_Zsl.h
//  ZSLCommonLib
//
//  Created by zhoushaolong on 15/8/28.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utils_Zsl : NSObject

#pragma mark - 提示
/**
 *  显示一个简单的AlertView（只有一个确认按钮）
 *
 *  @param message       显示信息文本
 *  @param alertDelegate alert的回调
 *
 *  @return 正在显示的Alert
 */
+ (UIAlertView *)showSimpleAlert:(NSString *)message delegate:(id)alertDelegate;

/**
 *  显示一个简单的AlertView（只有一个确认按钮）
 *
 *  @param message       显示信息文本
 *
 *  @return 正在显示的Alert
 */
+ (void)showSimpleAlert:(NSString *)message;

#pragma mark - 系统
/**
 *  获取info.plist定义app的bundleId
 *
 *  @return bundleId
 */
+ (NSString *)bundleIdString;

/**
 *  调用接口时传的版本号
 *
 *  @return 调用接口时传的版本号
 */
+ (NSString *)versionStringForRequest;

/**
 *  请求新版本
 *
 *  @param block 回调
 */
+ (void)sendCheckVersionRequestWithBlock:(void(^)(NSDictionary *infoDic))block;

#pragma mark - 数据／业务 操作

#pragma mark - 验证
/**
 *  根据身份证判断其是否为男性
 *
 *  @param idcard 身份证号码
 *
 *  @return YES：男性，NO：女性
 */
+ (BOOL)isMaleFromIdCard:(NSString *)idcard;

//正则式校验
/**
 *  邮箱是否合法
 *
 *  @param value 邮箱字符串
 *
 *  @return YES：合法，NO：不合法
 */
+ (BOOL)isValidEmail:(NSString *)value;

/**
 *  校验是否是一个合法的用户名，根据业务需要修改
 *
 *  @param value 待校验字符串
 *
 *  @return YES：合法，NO：不合法
 */
+ (BOOL)isValidUserName:(NSString *)value;

/**
 *  校验是否是一个合法的密码，根据业务需要修改
 *
 *  @param value 待校验字符串
 *
 *  @return YES：合法，NO：不合法
 */
+ (BOOL)isValidPassword:(NSString *)value;

/**
 *  校验是否是一个合法的手机号
 *
 *  @param value 待校验字符串
 *
 *  @return YES：合法，NO：不合法
 */
+ (BOOL)isValidMobilePhone:(NSString *)value;

/**
 *  校验是否是一个连续（相同/递增）的字符串
 *
 *  @param value 待校验字符串
 *
 *  @return YES：合法，NO：不合法
 */
+ (BOOL)isContinuousString:(NSString *)value;

/**
 *  校验是否是一个合法的身份证号
 *
 *  @param value 待校验字符串
 *
 *  @return YES：合法，NO：不合法
 */
+ (NSString *)isValidIDCard:(NSString *)value;
/**
 *  校验是否是一个合法的英文名
 *
 *  @param value 待校验字符串
 *
 *  @return YES：合法，NO：不合法
 */
+ (BOOL)isValidEnName:(NSString *)value;

/**
 *  校验是否是一个合法中文
 *
 *  @param value 待校验字符串
 *
 *  @return YES：合法，NO：不合法
 */
+ (BOOL)isValidAllCnString:(NSString *)value;

/**
 *  校验是否是一个合法中文名
 *
 *  @param value 待校验字符串
 *
 *  @return YES：合法，NO：不合法
 */
+ (BOOL)isValidCnName:(NSString *)value;

#pragma mark - 字符串操作
/**
 *  清除字符串中的空格、回车、换行符、制表符
 *
 *  @param value 原字符串
 *
 *  @return 过滤后字符串
 */
+ (NSString *)cleanString:(NSString *)value;

/**
 *  拼接医生完整职称
 *
 *  @param doctorTitle    职称
 *  @param departmentName 科室名
 *
 *  @return 完成职称
 */
+ (NSString *)fullTitleStringWithDepartmentName:(NSString *)departmentName doctorTitle:(NSString *)doctorTitle ;

#pragma mark - 时间日期
/**
 *  从身份证中获取出生日期
 *
 *  @param idcard 身份证号码
 *
 *  @return 生日
 */
+ (NSDate *)birthdayFromIdCard:(NSString *)idcard;

/**
 *  通过身份证号判断是否是成年人
 *
 *  @param idCard 身份证号
 *
 *  @return 判断结果
 */
+ (BOOL)isAdultFromIdCard:(NSString *)idCard;

/**
 *  获取对应日期的周几
 *
 *  @param dateString yyyy-MM-dd格式的日期字符串
 *
 *  @return 周几（星期一...）
 */
+ (NSString *)weekStringFromDate:(NSString*)dateString;

/**
 *  获取时分秒
 *
 *  @param dateString yyyy-MM-dd hhmmss格式的日期字符串
 *
 *  @return xx时xx分xx秒
 */
+ (NSString *)hourFormatStringFromDate:(NSString*)dateString;

/**
 *  获取距离天数，十位
 *
 *  @param dateString yyyy-MM-dd格式的日期字符串
 *
 *  @return 距离十位描述（）
 */
+ (NSString *)tenDaysStringFromDate:(NSString*)dateString;

/**
 *  获取距离天数，个位
 *
 *  @param dateString yyyy-MM-dd格式的日期字符串
 *
 *  @return 距离个位描述（）
 */
+ (NSString *)bitDaysStringFromDate:(NSString*)dateString;

/**
 *  获取距离天数，个位
 *
 *  @return yyyy-MM-dd HHmmss格式的日期字符串
 */
+ (NSString *)nowTimeDescriptiong;

/**
 *  格式化日期格式
 *
 *  @param date 时间
 *
 *  @return 格式化之后的日期
 */
+ (NSString *)fomartForDate:(NSDate *)date withformat:(NSString*)fomartStr;


/**
 *  调用接口时传的版本号
 *
 *  @param seeTimeFromServer seeTime字段从接口返回的值
 *
 *  @return 统一格式化之后的日期
 */
+ (NSString *)fomartSeeTimeFromServer:(NSString *)seeTimeFromServer;

/**
 *  格式化日期字符串 yyyy-MM-dd格式
 *
 *  @param date 时间
 *
 *  @return 格式化之后的日期
 */
+ (NSString *)fomartForDate:(NSDate *)date;


/**
 *  格式化日期字符串 formatStr 格式
 *
 *  @param datsStr 时间
 *
 *  @return 格式化之后的日期
 */
+ (NSDate *)fomartDateFromString:(NSString *)datsStr
                          format:(NSString*)formatStr;

/**
 *  格式化日期字符串 formatStr 格式
 *
 *  @param datsStr 时间
 *
 *  @return 格式化之后的日期
 */
+ (NSString *)fomartDateStringFromString:(NSString *)datsStr
                                  format:(NSString*)formatStr
                               newFormat:(NSString*)newFormat;


/**
 *  计算日期偏差
 *
 *  @param srcDate    日期基准
 *  @param tarDateStr 目标日期字符串
 *  @param formatStr  目标日期格式
 *
 *  @return <#return value description#>
 */
+ (NSInteger)dateNumberFromDate:(NSDate *)srcDate
                       toString:(NSString *)tarDateStr
                         format:(NSString*)formatStr;


@end
