//
//  ViewController.m
//  02-应用管理(生成3个子控件)
//
//  Created by C_bin on 15/11/7.
//  Copyright © 2015年 C_bin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//存储从plis中获取得数据
@property (nonatomic,strong) NSArray *appInfos;

@end

@implementation ViewController

#pragma mark 属性get懒加载
-(NSArray*) appInfos
{
    if (_appInfos == nil) {
        //1.获取mainBundle路径
        NSBundle *bundle = [NSBundle mainBundle];
        //2.根据bundle路径获取plist文件全路径
        NSString *path   = [bundle pathForResource:@"app" ofType:@"plist"];
        //3.读取plist中数据为数组
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        //4.给_appInfos赋值
        _appInfos = array;
    }
    return _appInfos;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    //1.定义控件frame (4)
    CGFloat subViewWidth = 100;
    CGFloat subViewHeight = 100;
    CGFloat marginX  = ( self.view.frame.size.width - 3 * subViewWidth) / 4;
    CGFloat marginY  = 20;
    //2.动态生成九宫格
    for (int i=0; i< self.appInfos.count; i++) {
        //2.1动态生成view
        UIView *subView = [[UIView alloc] init];
        //2.2添加子view
        [self.view addSubview:subView];
        //2.3给子view设置frame值
        int row     = i / 3;    //行
        int column  = i % 3;  //列
        CGFloat subViewX = marginX + column * (subViewWidth + marginX);
        CGFloat subViewY = 30 + row * (marginY + subViewHeight);
        subView.frame = CGRectMake(subViewX, subViewY, subViewWidth, subViewHeight);
//        [subView setBackgroundColor:[UIColor redColor]];
        //2.4遍历appInfos
        NSDictionary *appInfoDict = self.appInfos[i];
        
        //代码抽取
        [self displayAppInfo:appInfoDict andSubView:subView];
        
    }
}

//事件行为函数
-(void)downloadClick
{
    NSLog(@"==");
}

//代码抽取
-(void)displayAppInfo:(NSDictionary*) appInfoDict andSubView:(UIView *) subView
{
    //这里要给subView添加三个控件分别是UIImageView、UILabel、UIButton
    //2.5首先添加UIImageView
    UIImageView *appIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:appInfoDict[@"icon"]]];
    [subView addSubview:appIconView];
    //2.6设置appIconView的Frame
    CGFloat appIconViewWidth  = 60;
    CGFloat appIconViewHeight = 60;
    CGFloat appIconViewX      = (subView.frame.size.width - appIconViewWidth)/2;
    CGFloat appIconViewY      = 0;
    appIconView.frame         = CGRectMake(appIconViewX, appIconViewY, appIconViewWidth, appIconViewHeight);
    //2.7再添加UILabel
    UILabel *appNameViewLabel = [[UILabel alloc] init];
    appNameViewLabel.text     = appInfoDict[@"name"];
    appNameViewLabel.font     = [UIFont systemFontOfSize:15];
    appNameViewLabel.textAlignment= NSTextAlignmentCenter;
    [subView addSubview:appNameViewLabel];
    //2.8设置appNameViewLabel的frame
    CGFloat appNameViewLabelWidth = subView.frame.size.width;
    CGFloat appNameViewLabelHeight= 20;
    CGFloat appNameViewLabelX     = 0;
    CGFloat appNameViewLabelY     = appIconViewHeight;
    appNameViewLabel.frame        = CGRectMake(appNameViewLabelX, appNameViewLabelY, appNameViewLabelWidth, appNameViewLabelHeight);
    //2.9添加UIButton
    UIButton *downloadViewButton  = [UIButton buttonWithType:UIButtonTypeCustom];
    [subView addSubview:downloadViewButton];
    //2.10设置UIButton的frame
    CGFloat downloadViewButtonWidth = appIconViewWidth;
    CGFloat downloadViewButtonHeight= 20;
    CGFloat downloadViewButtonX     = appIconViewX;
    //2.11获得appNameViewLabel的最大y值
    CGFloat downloadViewButtonY     = CGRectGetMaxY(appNameViewLabel.frame);
    downloadViewButton.frame        = CGRectMake(downloadViewButtonX, downloadViewButtonY, downloadViewButtonWidth, downloadViewButtonHeight);
    //2.12设置downloadViewButton的属性
    [downloadViewButton setTitle:@"下载" forState:UIControlStateNormal];
    [downloadViewButton setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
    [downloadViewButton setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
    downloadViewButton.titleLabel.font = [UIFont systemFontOfSize:15];
    //2.13给button注册监听
    [downloadViewButton addTarget:self action:@selector(downloadClick) forControlEvents:UIControlEventTouchUpInside];
    
}
@end
