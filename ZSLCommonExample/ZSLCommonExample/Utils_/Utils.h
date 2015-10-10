//
//  Utils.h
//  ZSLCommonExample
//
//  Created by zhoushaolong on 15/10/10.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

#define AppDelegate__ ((AppDelegate*)([UIApplication sharedApplication].delegate))
#define RootController__ ((AppDelegate*)([UIApplication sharedApplication].delegate)).rootViewController

@interface Utils : NSObject

+ (UIViewController *)controllerInMainStroyboardWithID:(NSString *)storyboardID;

+ (UIViewController *)controllerInStroyboardWithName:(NSString *)storyboardName
                                        storyboardID:(NSString*)storyboardID;


@end
