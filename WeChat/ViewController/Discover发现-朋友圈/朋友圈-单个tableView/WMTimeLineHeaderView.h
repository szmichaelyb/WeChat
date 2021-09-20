//
//  WMTimeLineHeaderView.h
//  WeChat
//
//  Created by zhengwenming on 2017/9/18.
//  Copyright © 2017年 zhengwenming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JGGView.h"
#import "MessageInfoModel.h"


@interface WMTimeLineHeaderView : UITableViewHeaderFooterView
@property(nonatomic,retain)MessageInfoModel *model;
///**
// *  点击图片的block
// */
@property (nonatomic, copy)TapBlcok tapImageBlock;
@end
