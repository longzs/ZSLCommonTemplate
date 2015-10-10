//
//  MainTabBarController.m
//  ZSLCommonExample
//
//  Created by zhoushaolong on 15/10/10.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import "MainTabBarController.h"


@interface MainTabBarController ()<UITabBarControllerDelegate>

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    [self loadViewControllers];
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

+ (instancetype)instantiateFromMainStoryboard{
    
    return (MainTabBarController*)[Utils controllerInMainStroyboardWithID:@"MainTabBarController"];
}

- (void)loadViewControllers
{
    //
    NSArray *subViewControllers = self.viewControllers;
    
    //首页
    if (subViewControllers.count > 2) {
        BaseNavigationController *navHome = subViewControllers[2];
        if (navHome.viewControllers.count == 0) {
            ViewController1 *homeVC = [ViewController1 instantiateFromMainStoryboard];
            //self.homeVC = homeVC;
            [navHome setViewControllers:@[homeVC]];
            navHome.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_homeselect"];
        }
        
    }
}

#pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
//    if (!k_IsLogin && [self.viewControllers indexOfObject:viewController] == 2) {
//        weakSelf(wSelf);
//        [Root_Controller showLoginViewControllerWithCompletion:^(BOOL finishFlag) {
//            if (finishFlag) {
//                wSelf.selectedIndex = 2;
//            }
//        }];
//        return NO;
//    }
//    else {
//        return YES;
//    }
    return YES;
}

@end
