//
//  BaseViewController.m
//  ZSLCommonExample
//
//  Created by zhoushaolong on 15/10/10.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@property (nonatomic, copy) NSString *currnetTitle;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (IOS_VERSION_7_LATER) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    //[self addDefaultBackButtonOfNext];
    
    if (IOS_VERSION_LESS_THAN(@"7") && self.navigationController && self.navigationController.viewControllers.count > 1) {
        //返回按钮
//        UIBarButtonItem *barButton = [Utils backbuttonItemWithTarget:self action:@selector(clickBackBarButton:)];
//        self.navigationItem.leftBarButtonItem = barButton;
    }
    
    [self requestServerDataWith:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_currnetTitle) {
        self.navigationItem.title = _currnetTitle;
    }
}

- (void)rightSwipeToBack:(UISwipeGestureRecognizer*)sender{
    DLog(@"当前导航栈数量：%lu", (unsigned long)[self.navigationController.viewControllers count]);
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    
    NSString *tmpTitle = nil;
    if (self.navigationItem.title) {
        tmpTitle = [NSString stringWithFormat:@"%@",self.navigationItem.title];
    }
    
    self.navigationItem.title = @" ";
    
    if (tmpTitle) {
        _currnetTitle = tmpTitle;
    }
    
    [super viewWillDisappear:animated];
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    _currnetTitle = title;
}

- (void)dealloc
{
    if (self.currentRequestId != 0) {
        [[ZSLHttpManager sharedInstance] CancelRequestByID:self.currentRequestId];
    }
}

+ (instancetype)instantiateFromMainStoryboard{
    return nil;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)requestServerDataWith:(BOOL)bLoading{
    
}

-(void)processRsponseData{
    
}

+(instancetype)viewControllerInstance{
    
    return nil;
}

@end
