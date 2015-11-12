//
//  ViewController.m
//  01-应用管理
//
//  Created by C_bin on 15/11/4.
//  Copyright © 2015年 C_bin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//存储从plist中获取的数据
@property (nonatomic,strong) NSArray *appInfos;

@end

@implementation ViewController

-(void)displayAppInfo:(NSDictionary*) appInfo subView:(UIView*) subView
{
    
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    //动态生成九宫格的方块
    for (int i=0; i <= self.appInfos.count; i++) {
        //动态生成view
        UIView *subView = [[UIView alloc] init];
        [self.view addSubview:subView];
        //计算frame
        CGFloat subViewW = 100;
        CGFloat subViewH = 100;
        //子view的横向间距 = （父view的宽度 - 3 * 子view的宽度）/4
        CGFloat marginX = (self.view.frame.size.width - 3 * subViewW)/4;
        //子view的纵向间距=20
        CGFloat marginY = 20;
        //当前子view的行号 = 当前遍历到得索引值 / 总列数
        int row = i/3;
        //当前子view的列号 = 当前遍历到得索引值 % 总列数
        int column = i%3;
        //子view的横坐标公式 = 子view的横向间距 + 列号 *（子view的横向间距 + 子view的宽度）
        CGFloat subViewX = marginX + column * (marginX + subViewW);
        //子view的纵向坐标间距 = 20 + 行号 *（子view的纵向间距 + 子view的高度）
        CGFloat subViewY = 20 + row * (marginY + subViewH);
        
        subView.frame = CGRectMake(subViewX, subViewY, subViewW, subViewH);
        subView.backgroundColor = [UIColor redColor];
        
    }
}

//属性懒加载
-(NSArray*) appInfos
{
    if (_appInfos == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path   = [bundle pathForResource:@"app" ofType:@"plist"];
        _appInfos = [NSArray arrayWithContentsOfFile:path];
    }
    return _appInfos;
}


@end
