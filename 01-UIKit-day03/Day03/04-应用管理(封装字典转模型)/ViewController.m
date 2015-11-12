//
//  ViewController.m
//  04-应用管理(封装字典转模型)
//
//  Created by C_bin on 15/11/8.
//  Copyright © 2015年 C_bin. All rights reserved.
//

#import "ViewController.h"
#import "CBAppInfo.h"

@interface ViewController ()

//存储从plist中获取得数据
@property (nonatomic,strong) NSArray *appInfos;

@end

@implementation ViewController

#pragma mark 数据懒加载
-(NSArray*)appInfos
{
    if (_appInfos == nil) {
        //调用 CBAppInfo的类方法,返回模型数组
        _appInfos = [CBAppInfo appInosList];
    }
    return _appInfos;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    //设置控件view的大小
    CGFloat subViewWidth = 100;
    CGFloat subViewHeight= 100;
    
    //控件view之间的间距
    CGFloat marginX      = (self.view.frame.size.width - 3 * subViewWidth)/4;
    CGFloat marginY      = 20;
    
    //动态生成九宫格的方块
    for (int i=0; i < self.appInfos.count ; i++) {
        UIView *subView     = [[UIView alloc] init];
        [self.view addSubview:subView];
        CGFloat row         = i / 3;
        CGFloat column      = i % 3;
        CGFloat subViewX    = marginX + row * (marginX + subViewWidth);
        CGFloat subViewY    = 30 + column * (marginY + subViewHeight);
        subView.frame       = CGRectMake(subViewX, subViewY, subViewWidth, subViewHeight);
        
        //取得appInfos中的遍历数据
        CBAppInfo *appInfo  = self.appInfos[i];
        //添加三个子控件到subView
        [self displayAppInfo:appInfo andSubView:subView];
    }
    
}

//代码抽取
-(void)displayAppInfo:(CBAppInfo*) appInfo andSubView:(UIView*) subView
{
    //1.添加appIconImageView
    UIImageView *appIconImageView       = [[UIImageView alloc] initWithImage:[UIImage imageNamed:appInfo.icon]];
    CGFloat     appIconImageViewWidth  = 60;
    CGFloat     appIconImageViewHeight = 60;
    CGFloat     appIconImageViewX      = (subView.frame.size.width - appIconImageViewWidth) / 2;
    CGFloat     appIconImageViewY      = 0;
    appIconImageView.frame              = CGRectMake(appIconImageViewX, appIconImageViewY, appIconImageViewWidth, appIconImageViewHeight);
    [subView addSubview:appIconImageView];
    
    //2.添加appNameLabel
    UILabel     *appNameLabel           = [[UILabel alloc] init];
    CGFloat     appNameLabelWidth      = subView.frame.size.width;
    CGFloat     appNameLabelHeight     = 20;
    CGFloat     appNameLabelX          = 0;
    CGFloat     appNameLabelY          = appIconImageViewHeight;
    appNameLabel.frame                  = CGRectMake(appNameLabelX, appNameLabelY, appNameLabelWidth, appNameLabelHeight);
    appNameLabel.text                   = appInfo.name;
    appNameLabel.font                   = [UIFont systemFontOfSize:15];
    appNameLabel.textAlignment          = NSTextAlignmentCenter;
    [subView addSubview:appNameLabel];
    
    //3.添加downloadButton
    UIButton    *downloadButton         = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat     downloadButtonWidth    = appIconImageViewWidth;
    CGFloat     downloadButtonHeight   = 20;
    CGFloat     downloadButtonX        = appIconImageViewX;
    CGFloat     downloadButtonY        = CGRectGetMaxY(appNameLabel.frame);
    downloadButton.frame                = CGRectMake(downloadButtonX, downloadButtonY, downloadButtonWidth, downloadButtonHeight);
    downloadButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [downloadButton setTitle:@"下载" forState:UIControlStateNormal];
    [downloadButton setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
    [downloadButton setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateNormal];
    [subView addSubview:downloadButton];
}

@end
