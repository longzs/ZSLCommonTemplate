//
//  Utils.m
//  ZSLCommonExample
//
//  Created by zhoushaolong on 15/10/10.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import "Utils.h"

@implementation Utils


+ (UIViewController *)controllerInMainStroyboardWithID:(NSString *)storyboardID
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    return [storyboard instantiateViewControllerWithIdentifier:storyboardID];
}

+ (UIViewController *)controllerInStroyboardWithName:(NSString *)storyboardName
                                      storyboardID:(NSString*)storyboardID
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    
    return [storyboard instantiateViewControllerWithIdentifier:storyboardID];
}


@end
