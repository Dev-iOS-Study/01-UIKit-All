//
//  CBAppInfoView.h
//  Day03
//
//  Created by C_bin on 15/11/8.
//  Copyright © 2015年 C_bin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CBAppInfo;

@interface CBAppInfoView : UIView

@property (nonatomic,strong) CBAppInfo *appInfo;

+(instancetype)appInfoView;

@end
