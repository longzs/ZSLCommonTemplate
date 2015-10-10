//
//  RootViewController.m
//  ZSLCommonExample
//
//  Created by zhoushaolong on 15/10/10.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //给root view controller一个入口
    AppDelegate__.rootViewController = self;
    //处理服务公共错误
//    weakSelf(wSelf);
//    [[ZSLHttpManager sharedInstance] setCommonProcess:^(HttpOperation *hop){
//        return NO;
//    }];
    MainTabBarController *vc = [MainTabBarController instantiateFromMainStoryboard];
    _mainTabController = vc;
    
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    
    
    //引导页
    //    if ([[EHUserDefaultManager sharedInstance] isFirstLaunch]) {
    //        [self showGuideViewController];
    //    }
    //    else {
    //        [self showMainViewController];
    //    }
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginNotify:) name:kNotifiLogin object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logoutNotify:) name:kNotifiLogout object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
