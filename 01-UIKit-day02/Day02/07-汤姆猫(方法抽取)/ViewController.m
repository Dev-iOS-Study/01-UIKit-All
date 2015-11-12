//
//  ViewController.m
//  07-汤姆猫(方法抽取)
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
    [self animationWithName:@"scratch" andImageCount:55];
}

-(IBAction)cymbal
{
    [self animationWithName:@"cymbal" andImageCount:12];
}

-(IBAction)fark
{
    [self animationWithName:@"fart" andImageCount:27];
}

-(IBAction)drink
{
    [self animationWithName:@"drink" andImageCount:80];
}

-(IBAction)eat
{
    [self animationWithName:@"eat" andImageCount:39];
}

-(IBAction)pie
{
    [self animationWithName:@"pie" andImageCount:23];
}

-(IBAction)footRight
{
    [self animationWithName:@"footRight" andImageCount:29];
}

-(IBAction)footLeft
{
    [self animationWithName:@"footLeft" andImageCount:29];
}

-(IBAction)knockOut
{
    [self animationWithName:@"knockout" andImageCount:80];
}

-(IBAction)stomach
{
    [self animationWithName:@"stomach" andImageCount:33];
}

#pragma mark 代码抽取
-(void) animationWithName:(NSString*) name andImageCount:(int) imageCount
{
    //如果正在执行动画，就不要执行其他动画
    if (self.tomcatImageView.isAnimating) {
        return;
    }
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:imageCount];
    for (int i=0; i <= imageCount; i++) {
        //根据索引生成图片名称
        NSString *imageName = [NSString stringWithFormat:@"%@_%02d",name,i];
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

@end
