//
//  CBAppInfoView.m
//  Day03
//
//  Created by C_bin on 15/11/8.
//  Copyright © 2015年 C_bin. All rights reserved.
//

#import "CBAppInfoView.h"
#import "CBAppInfo.h"

@interface CBAppInfoView ()

@property (weak,nonatomic) IBOutlet UIImageView *iconView;
@property (weak,nonatomic) IBOutlet UILabel     *nameView;

-(IBAction)downloadClick:(UIButton *)sender;

@end


@implementation CBAppInfoView

+(instancetype)appInfoView
{
    //从xib中加载subView
    NSBundle *bundle        = [NSBundle mainBundle];
    //加载xib中得到view
    CBAppInfoView *subView  = [[bundle loadNibNamed:@"CBAppInfoView" owner:nil options:nil] lastObject];
    return subView;
}

//重写属性的setter方法，给子控件赋值
-(void) setAppInfo:(CBAppInfo *)appInfo
{
    _appInfo                = appInfo;
    self.nameView.text      = appInfo.name;
    self.iconView.image     = [UIImage imageNamed:appInfo.icon];
}

-(IBAction)downloadClick:(UIButton *)sender
{
    self.superview.userInteractionEnabled = NO;
    
    sender.enabled          = NO;
    //提示正在下载
    UILabel *tipView    = [[UILabel alloc] init];
    [self.superview addSubview:tipView];
    tipView.text        = [NSString stringWithFormat:@"正在下载:%@",self.appInfo.name];
    CGFloat tipWidth    = 200;
    CGFloat tipHeight   = 25;
    CGFloat tipX        = (self.superview.frame.size.width - tipWidth) / 2;
    CGFloat tipY        = (self.superview.frame.size.height - tipHeight) / 2;
    tipView.frame       = CGRectMake(tipX, tipY, tipWidth, tipHeight);
    tipView.backgroundColor = [UIColor grayColor];
    tipView.textAlignment   = NSTextAlignmentCenter;
    //透明度
    tipView.alpha           = 0;
    //圆角
    tipView.layer.cornerRadius = 5;
    tipView.layer.masksToBounds = YES; //剪裁超过bounds的部分。
    
    //动画效果
    [UIView animateWithDuration:1.0 animations:^{
        tipView.alpha = 0.9;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 delay:3.0 options:UIViewAnimationOptionCurveLinear animations:^{
            tipView.alpha = 0;
        } completion:^(BOOL finished) {
            //从父控件中移除
            [tipView removeFromSuperview];
            //激活superView的用户交互
            self.superview.userInteractionEnabled = YES;
        }];
    }];
}


@end
