//
//  ViewController.m
//  08-汤姆猫(内存优化)
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
    
    //如果当前正在执行动画，就不要再执行其他动画
    if (self.tomcatImageView.isAnimating) {
        return;
    }
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:imageCount];
    for (int i=0; i <= imageCount; i++) {
        //根据索引生成图片名称
        NSString *imageName = [NSString stringWithFormat:@"%@_%02d",name,i];
        
        /*
           //根据图片名称创建图片
           - 使用imageName:创建出来的图片默认会进行缓存。
           UIImage  *image     = [UIImage imageNamed:imageName];
        
           + 使用 imageWithContentsOfFile: 不会缓存数据。
        */
        
        //获取图片全路径，注意如果图片是在assets.xcassets 中，图片会被压缩到assets包种，无法获取它的全路径，只能通过imageName：来获取图片。
        NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg"];
        //根据图片全路径创建图片
        UIImage  *image= [UIImage imageWithContentsOfFile:path];
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
    //动画执行结束是释放内存
    [self.tomcatImageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.tomcatImageView.animationDuration + 1];

}


@end
