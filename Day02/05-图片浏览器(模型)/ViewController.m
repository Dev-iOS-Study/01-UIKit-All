//
//  ViewController.m
//  05-图片浏览器(模型)
//
//  Created by C_bin on 15/11/4.
//  Copyright © 2015年 C_bin. All rights reserved.
//

#import "ViewController.h"
#import "ImageData.h"

@interface ViewController ()

//链接storyboard控件
- (IBAction)blink;
@property (weak,nonatomic) IBOutlet UILabel *indexLabel;
@property (weak,nonatomic) IBOutlet UILabel *descLabel;
@property (weak,nonatomic) IBOutlet UIImageView *imageView;
@property (weak,nonatomic) IBOutlet UIButton *leftB;
@property (weak,nonatomic) IBOutlet UIButton *rightB;

//字段缓冲
@property (strong,nonatomic) NSMutableArray *datas;

//属性
@property (nonatomic,assign) int index;

//行为
-(IBAction)previous;
-(IBAction)next;

@end

@implementation ViewController

#pragma mark 使用懒加载
-(NSMutableArray*)datas
{
    if (_datas == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"imageData" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        //创建可变数组
        _datas = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            ImageData *data = [ImageData imageDataWithDict:dict];
            [_datas addObject:data];
        }
    }
    return _datas;
}

#pragma mark 私有方法
-(void) chengeImage
{
    self.indexLabel.text = [NSString stringWithFormat:@"%d/%zd",self.index,self.datas.count];
    //从数组中取出模型
    ImageData *data = self.datas[self.index - 1];
    //使用模型给属性赋值
    self.imageView.image = [UIImage imageNamed:data.imageName];
    self.descLabel.text  = data.desc;
    //设置左右两边按钮是否可用
    self.leftB.enabled = (self.index != 1);
    self.rightB.enabled= (self.index != self.datas.count);
}

-(void)viewDidLoad
{
    self.index = 1;
    [self chengeImage];
}

-(IBAction)previous
{
    self.index--;
    [self chengeImage];
}
-(IBAction)next
{
    self.index++;
    [self chengeImage];
}

- (IBAction)blink {
}
@end
