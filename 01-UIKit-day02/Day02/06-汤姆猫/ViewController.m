//
//  ViewController.m
//  06-汤姆猫
//
//  Created by C_bin on 15/11/4.
//  Copyright © 2015年 C_bin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//链接storyboard控件
@property (weak,nonatomic) IBOutlet UIImageView *tomcatImageView;

//行为
-(IBAction)stomach;
-(IBAction)knockOut;
-(IBAction)footLeft;
-(IBAction)footRight;
-(IBAction)pie;
-(IBAction)eat;
-(IBAction)drink;
-(IBAction)fark;
-(IBAction)cymbal;
-(IBAction)scratch;

@end

@implementation ViewController

-(IBAction)scratch
{
    int imageCount = 55;
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:imageCount];
    for (int i=0; i <= imageCount; i++) {
        //根据索引生成图片名称
        NSString *imageName = [NSString stringWithFormat:@"scratch_%02d",i];
        //根据图片名称创建图片
        UIImage  *image     = [UIImage imageNamed:imageName];
        //把图片添加到数组
        [images addObject:image];
    }
    //设置动画所需图片
    self.tomcatImageView.animationImages = images;
    //设置动画执行时间
    self.tomcatImageView.animationDuration = imageCount * 0.05;
    //设置动画循环次数
    self.tomcatImageView.animationRepeatCount = 1;
    //开始动画
    [self.tomcatImageView startAnimating];
}

-(IBAction)cymbal
{
    int imageCount = 12;
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:imageCount];
    for (int i=0; i <= imageCount; i++) {
        //根据索引生成图片名称
        NSString *imageName = [NSString stringWithFormat:@"cymbal_%02d",i];
        //根据图片名称创建图片
        UIImage  *image     = [UIImage imageNamed:imageName];
        //把图片添加到数组
        [images addObject:image];
    }
    //设置动画所需图片
    self.tomcatImageView.animationImages = images;
    //设置动画执行时间
    self.tomcatImageView.animationDuration = imageCount * 0.05;
    //设置动画循环次数
    self.tomcatImageView.animationRepeatCount = 1;
    //开始动画
    [self.tomcatImageView startAnimating];
}

-(IBAction)fark
{
    int imageCount = 27;
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:imageCount];
    for (int i=0; i <= imageCount; i++) {
        //根据索引生成图片名称
        NSString *imageName = [NSString stringWithFormat:@"fart_%02d",i];
        //根据图片名称创建图片
        UIImage  *image     = [UIImage imageNamed:imageName];
        //把图片添加到数组
        [images addObject:image];
    }
    //设置动画所需图片
    self.tomcatImageView.animationImages = images;
    //设置动画执行时间
    self.tomcatImageView.animationDuration = imageCount * 0.05;
    //设置动画循环次数
    self.tomcatImageView.animationRepeatCount = 1;
    //开始动画
    [self.tomcatImageView startAnimating];
}

-(IBAction)drink
{
    int imageCount = 80;
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:imageCount];
    for (int i=0; i <= imageCount; i++) {
        //根据索引生成图片名称
        NSString *imageName = [NSString stringWithFormat:@"drink_%02d",i];
        //根据图片名称创建图片
        UIImage  *image     = [UIImage imageNamed:imageName];
        //把图片添加到数组
        [images addObject:image];
    }
    //设置动画所需的图片
    self.tomcatImageView.animationImages = images;
    //设置动画执行时间
    self.tomcatImageView.animationDuration = imageCount * 0.07;
    //设置动画循环次数
    self.tomcatImageView.animationRepeatCount = 1;
    //开始动画
    [self.tomcatImageView startAnimating];
}

-(IBAction)eat
{
    int imageCount = 39;
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:imageCount];
    for (int i=0; i <= imageCount; i++) {
        //根据索引生成图片名称
        NSString *imageName = [NSString stringWithFormat:@"eat_%02d",i];
        //根据图片名称创建图片
        UIImage  *image     = [UIImage imageNamed:imageName];
        //把图片添加到数组
        [images addObject:image];
    }
    //设置动画所需的图片
    self.tomcatImageView.animationImages = images;
    //设置动画执行时间
    self.tomcatImageView.animationDuration = imageCount * 0.05;
    //设置动画循环次数
    self.tomcatImageView.animationRepeatCount = 1;
    //开始动画
    [self.tomcatImageView startAnimating];
}

-(IBAction)pie
{
    int imageCount = 23;
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:imageCount];
    for (int i=0; i <= imageCount; i++) {
        //根据索引生成图片名称
        NSString *imageName = [NSString stringWithFormat:@"pie_%02d",i];
        //根据图片名称创建图片
        UIImage  *image     = [UIImage imageNamed:imageName];
        //把图片添加到数组
        [images addObject:image];
    }
    //设置动画所需的图片
    self.tomcatImageView.animationImages = images;
    //设置动画执行时间
    self.tomcatImageView.animationDuration = imageCount * 0.05;
    //设置动画循环次数
    self.tomcatImageView.animationRepeatCount = 1;
    //开始动画
    [self.tomcatImageView startAnimating];
}

-(IBAction)footRight
{
    int imageCount = 29;
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:imageCount];
    for (int i=0; i <= imageCount; i++) {
        //根据索引生成图片名称
        NSString *imageName = [NSString stringWithFormat:@"footRight_%02d",i];
        //根据图片名称创建图片
        UIImage  *image     = [UIImage imageNamed:imageName];
        //把图片添加到数组
        [images addObject:image];
    }
    //设置动画所需图片
    self.tomcatImageView.animationImages = images;
    //设置动画执行时间
    self.tomcatImageView.animationDuration = imageCount * 0.05;
    //设置动画循环次数
    self.tomcatImageView.animationRepeatCount = 1;
    //开始动画
    [self.tomcatImageView startAnimating];
}

-(IBAction)footLeft
{
    int imageCount = 29;
    NSMutableArray * images = [NSMutableArray arrayWithCapacity:imageCount];
    for (int i=0; i <= imageCount; i++) {
        //根据索引生成图片名称
        NSString *imageName = [NSString stringWithFormat:@"footLeft_%02d",i];
        //根据图片名称创建图片
        UIImage  *image     = [UIImage imageNamed:imageName];
        //把图片添加到数组
        [images addObject:image];
    }
    //设置动画所需图片
    self.tomcatImageView.animationImages = images;
    //设置动画执行时间
    self.tomcatImageView.animationDuration = imageCount * 0.05;
    //设置动画循环次数
    self.tomcatImageView.animationRepeatCount = 1;
    //开始动画
    [self.tomcatImageView startAnimating];
}

-(IBAction)knockOut
{
    int imageCount = 80;
    NSMutableArray * images = [NSMutableArray arrayWithCapacity:imageCount];
    for (int i=0; i <= imageCount; i++) {
        //根据索引生成图片名称
        NSString *imageName = [NSString stringWithFormat:@"knockout_%02d",i];
        //根据图片名称创建图片
        UIImage  *image     = [UIImage imageNamed:imageName];
        //把图片添加到数组
        [images addObject:image];
    }
    //设置动画所需图片
    self.tomcatImageView.animationImages = images;
    //设置动画执行试讲
    self.tomcatImageView.animationDuration = imageCount * 0.05;
    //设置动画循环次数
    self.tomcatImageView.animationRepeatCount = 1;
    //开始动画
    [self.tomcatImageView startAnimating];
}

-(IBAction)stomach
{
    
    int imageCount = 33;
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:imageCount];
    for (int i=0; i <= imageCount; i++) {
        //根据索引生成图片名称
        NSString *imageName = [NSString stringWithFormat:@"stomach_%02d",i];
        //根据图片名称创建图片
        UIImage *image      = [UIImage imageNamed:imageName];
        //把图片添加到数组
        [images addObject:image];
    }

    //把image赋值给执行动画所需要的图片/s
    self.tomcatImageView.animationImages   = images;
    //设置动画执行时间
    self.tomcatImageView.animationDuration = imageCount * 0.05;
    //设置动画循环次数
    self.tomcatImageView.animationRepeatCount = 1;
    //开始动画
    [self.tomcatImageView startAnimating];
}


@end
