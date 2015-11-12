//
//  ViewController.m
//  03-应用管理(字典转模型)
//
//  Created by C_bin on 15/11/7.
//  Copyright © 2015年 C_bin. All rights reserved.
//

#import "ViewController.h"
#import "CBAppInfo.h"

@interface ViewController ()

//存储从plist中获取得数据
@property (nonatomic,strong) NSArray* appInfos;

@end

@implementation ViewController

#pragma mark 属性get懒加载
-(NSArray*) appInfos
{
    if (_appInfos == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path   = [bundle pathForResource:@"app" ofType:@"plist"];
        NSArray  *dictArray  = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray * mutableArray = [NSMutableArray array];
        //字典转模型
        for (NSDictionary *dict in dictArray) {
            CBAppInfo * appInfo = [[CBAppInfo alloc] init];
            appInfo.icon        = dict[@"icon"];
            appInfo.name        = dict[@"name"];
            [mutableArray addObject:appInfo];
        }
        _appInfos = mutableArray;
    }
    return _appInfos;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    //设置视图view的大小
    CGFloat subViewWidth = 100;
    CGFloat subViewHeight= 100;
    
    //间距
    CGFloat marginX      = (self.view.frame.size.width - 3 * subViewWidth) / 4;
    CGFloat marginY      = 20;
    
    //动态生成九宫格
    for (int i=0; i < self.appInfos.count; i++) {
        UIView *subView = [[UIView alloc] init];
        [self.view addSubview:subView];
        CGFloat row      = i/3;
        CGFloat column   = i%3;
        CGFloat subViewX = marginX + column * (marginX + subViewWidth);
        CGFloat subViewY = 30 + row * (marginY + subViewHeight);
        subView.frame = CGRectMake(subViewX, subViewY, subViewWidth, subViewHeight);
        //取得当前遍历到的数据
        CBAppInfo *appInfo = self.appInfos[i];
        //生成三个子控件在subView中
        [self displayAppInfo:appInfo andSubView:subView];
    }
}

-(void)displayAppInfo:(CBAppInfo*) appInfo andSubView:(UIView*) subView
{
    //1.添加appIconView
    UIImageView *appIconView   = [[UIImageView alloc] initWithImage:[UIImage imageNamed:appInfo.icon]];
    [subView addSubview:appIconView];
    CGFloat appIconViewWidth   = 60;
    CGFloat appIconViewHeight  = 60;
    CGFloat appIconViewX       = (subView.frame.size.width - appIconViewWidth)/2;
    CGFloat appIconViewY       = 0;
    appIconView.frame          = CGRectMake(appIconViewX, appIconViewY, appIconViewWidth, appIconViewHeight);
    
    //2.添加appNameLabel
    UILabel *appNameLabel      = [[UILabel alloc] init];
    [subView addSubview:appNameLabel];
    appNameLabel.text          = appInfo.name;
    appNameLabel.textAlignment = NSTextAlignmentCenter;
    CGFloat appNameLabelWidth  = subView.frame.size.width;
    CGFloat appNameLabelHeight = 20;
    CGFloat appNameLabelX      = 0;
    CGFloat appNameLabelY      = appIconViewHeight;
    appNameLabel.frame         = CGRectMake(appNameLabelX, appNameLabelY, appNameLabelWidth, appNameLabelHeight);
    appNameLabel.font          = [UIFont systemFontOfSize:15];
    
    //3.添加downloadButton
    UIButton *downloadButton     = [UIButton buttonWithType:UIButtonTypeCustom];
    [subView addSubview:downloadButton];
    CGFloat downloadButtonWidth  = appIconViewWidth;
    CGFloat downloadButtonHeight = 20;
    CGFloat downloadButtonX      = appIconViewX;
    CGFloat downloadButtonY      = CGRectGetMaxY(appNameLabel.frame);
    downloadButton.frame         = CGRectMake(downloadButtonX, downloadButtonY, downloadButtonWidth, downloadButtonHeight);
    [downloadButton setTitle:@"下载" forState:UIControlStateNormal];
    [downloadButton setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
    [downloadButton setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
    downloadButton.titleLabel.font = [UIFont systemFontOfSize:15];
}

@end
