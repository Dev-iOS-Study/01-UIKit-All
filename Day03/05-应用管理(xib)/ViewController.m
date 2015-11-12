//
//  ViewController.m
//  05-应用管理(xib)
//
//  Created by C_bin on 15/11/8.
//  Copyright © 2015年 C_bin. All rights reserved.
//

#import "ViewController.h"
#import "CBAppInfo.h"
#import "CBAppInfoView.h"

@interface ViewController ()

//存储从plist中获取得数据
@property (nonatomic,strong) NSArray *appInfos;

@end

@implementation ViewController

#pragma mark 数据懒加载
-(NSArray*)appInfos
{
    if (_appInfos == nil) {
        _appInfos = [CBAppInfo appInfoList];
    }
    return _appInfos;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    int totalColumn         = 3;
    CGFloat subViewWidth    = 100;
    CGFloat subViewHeight   = 100;
    CGFloat marginX         = (self.view.frame.size.width - totalColumn * subViewWidth) / (totalColumn + 1);
    CGFloat marginY         = 20;
    
    //动态生成九宫格
    for (int i=0; i < self.appInfos.count; i++) {
        CBAppInfoView *subView      = [CBAppInfoView appInfoView];
        int row                     = i / totalColumn;
        int column                  = i % totalColumn;
        CGFloat subViewX           = marginX + column * (marginX + subViewWidth);
        CGFloat subViewY           = 30 + row * (marginY + subViewHeight);
        subView.frame               = CGRectMake(subViewX, subViewY, subViewWidth, subViewHeight);
        [self.view addSubview:subView];
        //遍历数据
        CBAppInfo *appInfo          = self.appInfos[i];
        subView.appInfo             = appInfo;
        
    }
    
    
}

@end
