//
//  ReqUploadModel.h
//  ZSLCommonLib
//
//  Created by zhoushaolong on 15/9/30.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import "ReqBaseModel.h"

/**
 *  for upload file request
 */
@interface ReqUploadModel : ReqBaseModel

@property(nonatomic, copy)NSString*  uploadFilePath;

@end
