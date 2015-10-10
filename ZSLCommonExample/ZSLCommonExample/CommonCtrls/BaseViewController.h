//
//  BaseViewController.h
//  ZSLCommonExample
//
//  Created by zhoushaolong on 15/10/10.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ZSLCommonLib/ZSLHttpManager.h>

/**
 *  通过storyboard加载的协议，满足此协议代表是在storyboard中绘制的界面，可以通过instantiateFromMainStoryboard实例化
 */
@protocol EHLoadByStoryboard <NSObject>

@optional
+ (instancetype)instantiateFromMainStoryboard;

@end


@interface BaseViewController : UIViewController<EHLoadByStoryboard>

//最后的请求id，在dealloc中会cancel
@property (nonatomic) int currentRequestId;

// 不支持右滑返回  默认为NO
@property (nonatomic, assign) BOOL NOSupportRightSwipe;


-(void)requestServerDataWith:(BOOL)bLoading;

-(void)processRsponseData;

+(instancetype)viewControllerInstance;

@end
