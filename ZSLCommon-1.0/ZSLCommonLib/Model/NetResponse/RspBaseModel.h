//
//  RspBaseModel.h
//  ZSLCommonLib
//
//  Created by zhoushaolong on 15/9/30.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import "JSONModel.h"

#pragma mark - 数据模型协议
/**
 *  支持数据库操作的模型的协议
 */
@protocol RspModelDBDelegate <NSObject>

@optional
/**
 *  主键名
 *
 *  @return 主键的名称，可以是多主键
 */
+ (NSArray *)primaryKeys;

/**
 *  对应的表名
 *
 *  @return 表名
 */
+ (NSString *)tableName;

/**
 *  通过FMDB查找结果实例化
 *
 *  @param set FMDB查找结果
 *
 *  @return 实例
 */
+ (instancetype)instanceFromResultSet:(NSDictionary *)set;

/**
 *  所有属性对应的数据库中的字段
 *
 *  @return 字典，key表示数据库中的字段名，value表示对应字段值
 */
- (NSDictionary *)dicForDatabase;

@end


@interface RspBaseModel : JSONModel<RspModelDBDelegate>


@end
