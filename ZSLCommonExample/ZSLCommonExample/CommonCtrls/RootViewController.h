//
//  RootViewController.h
//  ZSLCommonExample
//
//  Created by zhoushaolong on 15/10/10.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import "BaseViewController.h"
#import "MainTabBarController.h"
#import "BaseNavigationController.h"

@interface RootViewController : BaseViewController
@property(nonatomic, strong)MainTabBarController* mainTabController;
@end
