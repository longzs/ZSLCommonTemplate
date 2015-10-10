//
//  Utils_Zsl.m
//  ZSLCommonLib
//
//  Created by zhoushaolong on 15/8/28.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import "Utils_Zsl.h"
#import "TipString.h"
#import "RegexKitLite.h"
#import "NSDate+TKCategory.h"
#import "CommonMacro.h"

@implementation Utils_Zsl


+ (NSString *)bundleIdString
{
    NSString *identifier =  [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleIdentifierKey];
    return identifier;
}


+ (UIAlertView *)showSimpleAlert:(NSString *)message delegate:(id)alertDelegate
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:k_Title_Alert message:message delegate:alertDelegate cancelButtonTitle:k_Btn_Confrim otherButtonTitles: nil];
    [alert show];
    return alert;
}

+ (void)showSimpleAlert:(NSString *)message
{
    [self showSimpleAlert:message delegate:nil];
}

+ (NSDate *)birthdayFromIdCard:(NSString *)idcard
{
    NSString *birthday;
    if ([idcard length] == 15) {
        birthday = [NSString stringWithFormat:@"19%@",[idcard substringWithRange:NSMakeRange(6,6)]];
    }else {
        birthday = [idcard substringWithRange:NSMakeRange(6,8)];
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMdd";
    return [formatter dateFromString:birthday];
}

+ (BOOL)isAdultFromIdCard:(NSString *)idCard
{
    NSDate *brithday = [self birthdayFromIdCard:idCard];
    NSCalendar *cal = [NSCalendar currentCalendar];
    //    NSDateComponents *components = [[NSDateComponents alloc] init];
    //    components.year = 18;
    NSDate *dayOf18 = [cal dateByAddingUnit:(NSCalendarUnitYear) value:18 toDate:brithday options:(NSCalendarWrapComponents)];
    
    if ([dayOf18 timeIntervalSinceDate:[NSDate date]] <= 0.0f) {
        return YES;
    }
    else {
        return NO;
    }
    
}

+ (BOOL)isMaleFromIdCard:(NSString *)idcard
{
    if ([idcard length] == 15) {
        return [[idcard substringFromIndex:14] intValue]%2 == 1;
    }else {
        return [[idcard substringWithRange:NSMakeRange(16,1)] intValue]%2 == 1;
    }
}

+ (BOOL)isValidEmail:(NSString *)value
{
    if ([value isKindOfClass:[NSNull class]]) {
        return NO;
    }
    NSString *regex = @"^([a-zA-Z0-9]+[_|\\_|\\.\\-]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\\_|\\.|\\-]?)*[a-zA-Z0-9]+\\.[a-zA-Z]{2,3}$";
    return [value isMatchedByRegex:regex];
}

+ (BOOL)isValidUserName:(NSString *)value
{
    if ([value isKindOfClass:[NSNull class]]) {
        return NO;
    }
    NSString *regex = @"^[a-zA-Z0-9\\/-]+$";
    return [value isMatchedByRegex:regex];
}

+ (BOOL)isValidPassword:(NSString *)value
{
    if ([value isKindOfClass:[NSNull class]]) {
        return NO;
    }
    NSString *regex = @"^[a-zA-Z0-9\\/-]+$";
    return [value isMatchedByRegex:regex];
}

+ (BOOL)isValidMobilePhone:(NSString *)value
{
    if ([value isKindOfClass:[NSNull class]]) {
        return NO;
    }
    NSString *regex = @"^1\\d{10}$";
    return [value isMatchedByRegex:regex];
}

+ (BOOL)isContinuousString:(NSString *)value
{
    if ([value isKindOfClass:[NSNull class]]) {
        return YES;
    }
    unichar begin = [value characterAtIndex:0];
    NSInteger count = [value length];
    NSMutableString *newStr = [[NSMutableString alloc] initWithFormat:@"%c",begin];
    for (int i = 0; i < count-1; i++) {
        [newStr appendFormat:@"%c",++begin];
    }
    if ([value isEqualToString:newStr]) {
        return YES;
    }
    begin = [value characterAtIndex:0];
    newStr = [[NSMutableString alloc] initWithFormat:@"%c",begin];
    for (int i = 0; i < count-1; i++) {
        [newStr appendFormat:@"%c",--begin];
    }
    if ([value isEqualToString:newStr]) {
        return YES;
    }
    begin = [value characterAtIndex:0];
    newStr = [[NSMutableString alloc] initWithFormat:@"%c",begin];
    for (int i = 0; i < count-1; i++) {
        [newStr appendFormat:@"%c",begin];
    }
    if ([value isEqualToString:newStr]) {
        return YES;
    }
    return NO;
}

+ (BOOL)isValidEnName:(NSString *)value
{
    if ([value isKindOfClass:[NSNull class]]) {
        return NO;
        
    }
    NSString *regex = @"^[a-zA-Z \\.]+$";
    return [value isMatchedByRegex:regex];
}

+ (BOOL)isValidAllCnString:(NSString *)value
{
    if ([value isKindOfClass:[NSNull class]]) {
        return NO;
        
    }
    NSString *regex = @"^[\u4e00-\u9fff]+$";
    return [value isMatchedByRegex:regex];
}

+ (BOOL)isValidCnName:(NSString *)value
{
    return [self isValidAllCnString:value];
}

+ (NSString *)isValidIDCard:(NSString *)value
{
    if ([value isKindOfClass:[NSNull class]] || value.length == 0) {
        return k_Msg_Valid_IdCard_Empty;
    }
    NSDictionary *area = [[NSDictionary alloc] initWithObjectsAndKeys:
                          @"北京",@"11",@"天津",@"12",@"河北",@"13",@"山西",@"14",@"内蒙古",@"15",//华北
                          @"辽宁",@"21",@"吉林",@"22",@"黑龙江",@"23",//东北
                          @"上海",@"31",@"江苏",@"32",@"浙江",@"33",@"安徽",@"34",@"福建",@"35",@"江西",@"36",@"山东",@"37",//华东
                          @"河南",@"41",@"湖北",@"42",@"湖南",@"43",@"广东",@"44",@"广西",@"45",@"海南",@"46",@"重庆",//中南
                          @"50",@"四川",@"51",@"贵州",@"52",@"云南",@"53",@"西藏",@"54",//西南
                          @"陕西",@"61",@"甘肃",@"62",@"青海",@"63",@"宁夏",@"64",@"新疆",@"65",//西北
                          @"台湾",@"71",@"香港",@"81",@"澳门",@"82",@"国外",@"91", nil];
    NSArray *errors = [NSArray arrayWithObjects:k_Msg_Valid_IdCard_Good,
                       k_Msg_Valid_IdCard_LenthErr,
                       k_Msg_Valid_IdCard_BirthErr,
                       k_Msg_Valid_IdCard_ValidErr,
                       k_Msg_Valid_IdCard_LocalErr, nil];
    if ([value length] != 15 && [value length] != 18) {
        return [errors objectAtIndex:1];
    }
    
    if (![area objectForKey:[value substringToIndex:2]]) {
        return [errors objectAtIndex:4];
    }
    NSString *ereg = nil;
    if ([value length] == 15) {
        ereg = @"^\\d{15}";
        if (![value isMatchedByRegex:ereg]){
            return [errors objectAtIndex:2];
        }
        NSString *birthday = [NSString stringWithFormat:@"19%@",[value substringWithRange:NSMakeRange(6,6)]];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMdd";
        NSDate *date = [formatter dateFromString:birthday];
        if (date) {
            return nil;
        }else {
            return [errors objectAtIndex:2];
        }
    }else if ([value length] == 18) {
        ereg = @"^\\d{17}[0-9xX]{1}$";
        if (![value isMatchedByRegex:ereg]){
            return [errors objectAtIndex:2];
        }
        NSString *birthday = [value substringWithRange:NSMakeRange(6,8)];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMdd";
        NSDate *date = [formatter dateFromString:birthday];
        
        NSMutableArray *idCards = [NSMutableArray array];;
        for (int i = 0; i < 18; i++) {
            [idCards addObject:[value substringWithRange:NSMakeRange(i, 1)]];
        }
        if(date){
            NSInteger S = ([[idCards objectAtIndex:0] intValue] + [[idCards objectAtIndex:10] intValue]) * 7
            + ([[idCards objectAtIndex:1] intValue] + [[idCards objectAtIndex:11] intValue]) * 9
            + ([[idCards objectAtIndex:2] intValue] + [[idCards objectAtIndex:12] intValue]) * 10
            + ([[idCards objectAtIndex:3] intValue] + [[idCards objectAtIndex:13] intValue]) * 5
            + ([[idCards objectAtIndex:4] intValue] + [[idCards objectAtIndex:14] intValue]) * 8
            + ([[idCards objectAtIndex:5] intValue] + [[idCards objectAtIndex:15] intValue]) * 4
            + ([[idCards objectAtIndex:6] intValue] + [[idCards objectAtIndex:16] intValue]) * 2
            + [[idCards objectAtIndex:7] intValue] * 1
            + [[idCards objectAtIndex:8] intValue] * 6
            + [[idCards objectAtIndex:9] intValue] * 3 ;
            NSInteger Y = S % 11;
            NSString *JYM = @"10X98765432";
            NSString *M = [JYM substringWithRange:NSMakeRange(Y,1)];
            if([[M uppercaseString] isEqualToString:[[idCards objectAtIndex:17] uppercaseString]])
                return nil;
            else
                return [errors objectAtIndex:3];
        }
        else {
            return [errors objectAtIndex:2];
        }
    }else {
        return [errors objectAtIndex:1];
    }
    
}




+ (NSString *)cleanString:(NSString *)value
{
    NSString *reg = @"\\s*|\t|\r|\n";
    value = [value stringByReplacingOccurrencesOfRegex:reg withString:@""];
    return value;
}

+ (NSString *)fullTitleStringWithDepartmentName:(NSString *)departmentName doctorTitle:(NSString *)doctorTitle
{
    
    if (departmentName.length == 0 && doctorTitle.length == 0) {
        return @"";
    }
    
    NSString *fullTitle = @"";
    
    if (departmentName.length > 0) {
        fullTitle = [fullTitle stringByAppendingFormat:@"%@",departmentName];
    }
    
    if (doctorTitle.length > 0) {
        
        if (![fullTitle isEqualToString:@""]) {
            fullTitle = [fullTitle stringByAppendingString:@" "];
        }
        
        fullTitle = [fullTitle stringByAppendingFormat:@"%@",doctorTitle];
    }
    
    fullTitle = [fullTitle stringByAppendingString:@""];
    return fullTitle;
}

+ (NSString *)weekStringFromDate:(NSString*)dateString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSDate *date = [formatter dateFromString:dateString];
    if (!date) {
        NSArray *subArray = [dateString componentsSeparatedByString:@" "];
        NSString *subDataStr = subArray.count > 0 ? subArray.firstObject : nil;
        date = subDataStr ? [formatter dateFromString:subDataStr] : nil;
    }
    NSInteger weekDay = [date dateInformation].weekday;
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    NSUInteger firstWeekday = [cal firstWeekday];
    weekDay -= firstWeekday - 1;
    if (weekDay < 1) {
        weekDay += 7;
    }
    
    switch (weekDay) {
        case 2:
            return @"星期一";
            break;
        case 3:
            return @"星期二";
            break;
        case 4:
            return @"星期三";
            break;
        case 5:
            return @"星期四";
            break;
        case 6:
            return @"星期五";
            break;
        case 7:
            return @"星期六";
            break;
        case 1:
            return @"星期日";
            break;
            
        default:
            break;
    }
    return nil;
}

+ (NSString *)hourFormatStringFromDate:(NSString*)dateString{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [formatter dateFromString:dateString];
    NSInteger ht = [date dateInformation].hour;
    NSInteger mt = [date dateInformation].minute;
    NSInteger st = [date dateInformation].second;
    
    NSString *result = [NSString stringWithFormat:@"%ld时%ld分%ld秒更新",(long)ht,(long)mt,(long)st];
    return result;
}

+ (NSString *)tenDaysStringFromDate:(NSString*)dateString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSDate *date = [formatter dateFromString:dateString];
    
    NSDate * now = [NSDate date];
    NSString *nowStr =  [formatter stringFromDate:now];
    NSDate *nowDate = [formatter dateFromString:nowStr];
    NSTimeInterval timeBetween = [date timeIntervalSinceDate:nowDate];
    //
    int days=((int)timeBetween)/(3600*24);
    NSString *tenDay=[[NSString alloc] initWithFormat:@"%d",days/10];
    return tenDay;
    
}


+ (NSString *)bitDaysStringFromDate:(NSString*)dateString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSDate *date = [formatter dateFromString:dateString];
    
    NSDate * now = [NSDate date];
    NSString *nowStr =  [formatter stringFromDate:now];
    NSDate *nowDate = [formatter dateFromString:nowStr];
    NSTimeInterval timeBetween = [date timeIntervalSinceDate:nowDate];
    //
    int days=((int)timeBetween)/(3600*24);
    NSString *bitDay=[[NSString alloc] initWithFormat:@"%d",days%10];
    return bitDay;
    
}

+ (NSString *)nowTimeDescriptiong{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSDate * now = [NSDate date];
    NSString *nowStr =  [formatter stringFromDate:now];
    return nowStr;
}

+ (NSString *)versionStringForRequest
{
    return [NSString stringWithFormat:@"IOS%@",VERSION_APP_STRING];
}

+ (void)sendCheckVersionRequestWithBlock:(void (^)(NSDictionary *))block
{
    
    
}


+ (NSString *)fomartSeeTimeFromServer:(NSString *)seeTimeFromServer
{
    if (seeTimeFromServer.length == 0) {
        return @"";
    }
    
    NSInteger time = [seeTimeFromServer integerValue];
    if (time == 1) {
        return @"上午";
    }else if (time == 2) {
        return @"下午";
    }else if (time == 3) {
        return @"下午";
    }else if (time == 4) {
        return @"夜晚";
    }else if (time == 5) {
        return @"早班";
    }else if (time == 6) {
        return @"全天";
    }else {
        
        if ([seeTimeFromServer isKindOfClass:[NSString class]]
            && seeTimeFromServer.length > 0) {
            return [NSString stringWithFormat:@"%@",seeTimeFromServer];
        }
        
        return @"";
    }
}

+ (NSString *)fomartForDate:(NSDate *)date
{
    if (nil == date) {
        return @"";
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    
    NSString *nowStr =  [formatter stringFromDate:date];
    return nowStr;
}

+ (NSString *)fomartForDate:(NSDate *)date withformat:(NSString*)fomartStr{
    if (nil == date) {
        return @"";
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = fomartStr;
    
    NSString *nowStr =  [formatter stringFromDate:date];
    return nowStr;
}

+ (NSDate *)fomartDateFromString:(NSString *)datsStr
                          format:(NSString*)formatStr{
    
    if (nil == datsStr
        || nil == formatStr) {
        return nil;
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = formatStr;
    NSDate *date = [formatter dateFromString:datsStr];
    
    if (!date) {
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        date = [formatter dateFromString:datsStr];
    }
    
    return date;
}

+ (NSString *)fomartDateStringFromString:(NSString *)datsStr
                                  format:(NSString*)formatStr
                               newFormat:(NSString*)newFormat;{
    if (nil == datsStr
        || nil == formatStr) {
        return nil;
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = formatStr;
    NSDate *date = [formatter dateFromString:datsStr];
    
    if (!date) {
        NSArray *subArray = [datsStr componentsSeparatedByString:@" "];
        NSString *subDataStr = subArray.count > 0 ? subArray.firstObject : nil;
        date = subDataStr ? [formatter dateFromString:subDataStr] : nil;
    }
    
    formatter.dateFormat = newFormat;
    return date ? [formatter stringFromDate:date] : @"";
}

+ (NSInteger)dateNumberFromDate:(NSDate *)srcDate toString:(NSString *)tarDateStr format:(NSString *)formatStr
{
    if (nil == srcDate
        || nil == tarDateStr
        || nil == formatStr) {
        return NSNotFound;
    }
    
    
    //取出目标日期
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = formatStr;
    NSDate *tarDate = [formatter dateFromString:tarDateStr];
    if (!tarDate) {
        NSArray *subArray = [formatStr componentsSeparatedByString:@" "];
        NSString *subDataStr = subArray.count > 0 ? subArray.firstObject : nil;
        tarDate = subDataStr ? [formatter dateFromString:subDataStr] : nil;
    }
    //时间转换为0点
    NSString *zeroFormat = @"yyy-MM-dd";
    formatter.dateFormat = zeroFormat;
    NSString *srcDateZero = [formatter stringFromDate:srcDate];
    NSString *tarDateZero = [formatter stringFromDate:tarDate];
    
    //计算时间差
    NSTimeInterval timeInterval = [[formatter dateFromString:tarDateZero] timeIntervalSinceDate:[formatter dateFromString:srcDateZero]];
    NSInteger result = (NSInteger)timeInterval / 3600 / 24;
    
    return result;
    
}

@end
