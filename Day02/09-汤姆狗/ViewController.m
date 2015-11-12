//
//  ViewController.m
//  09-汤姆狗
//
//  Created by C_bin on 15/11/4.
//  Copyright © 2015年 C_bin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *tomdogImageView;

-(IBAction)blink;

@end

@implementation ViewController

-(IBAction)blink
{
    [self animationWithName:@"blink" andImageCount:3 andAnimationDuration:0.08 andAnimationRepeatCount:4];
}

#pragma mark 代码抽取
-(void) animationWithName:(NSString*) name andImageCount:(int) imageCount andAnimationDuration:(double) modulus andAnimationRepeatCount:(int) count
{
    
    //如果当前正在执行动画，就不要再执行其他动画
    if (self.tomdogImageView.isAnimating) {
        return;
    }
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:imageCount];
    for (int i=0; i <= imageCount; i++) {
        //根据索引生成图片名称
        NSString *imageName = [NSString stringWithFormat:@"%@_%03d",name,i];
        
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
    self.tomdogImageView.animationImages = images;
    //设置动画执行时间
    self.tomdogImageView.animationDuration = imageCount * modulus;
    //设置动画循环次数
    self.tomdogImageView.animationRepeatCount = count;
    //开始动画
    [self.tomdogImageView startAnimating];
    //动画执行结束是释放内存
    [self.tomdogImageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.tomdogImageView.animationDuration*count + 0.1];
    
}

@end
