//
//  ViewController.m
//  04-图片浏览器(使用plist)
//
//  Created by C_bin on 15/11/4.
//  Copyright © 2015年 C_bin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//链接storyboard控件
@property (weak,nonatomic) IBOutlet UILabel *indexLabel;
@property (weak,nonatomic) IBOutlet UILabel *descLabel;
@property (weak,nonatomic) IBOutlet UIImageView *mianImage;
@property (weak,nonatomic) IBOutlet UIButton *leftB;
@property (weak,nonatomic) IBOutlet UIButton *rightB;

//缓存字段数组
@property (strong,nonatomic) NSArray * datas;

//属性
@property (nonatomic,assign) int index;

//行为
-(IBAction)previous;
-(IBAction)next;

@end    /*---------------------------------*/

@implementation ViewController

#pragma mark 使用懒加载
-(NSArray*)datas
{
    if(_datas == nil){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"imageData" ofType:@"plist"];
        _datas = [NSArray arrayWithContentsOfFile:path];
    }
    return _datas;
}

#pragma mark 私有方法
-(void) chengeImage
{
    self.indexLabel.text = [NSString stringWithFormat:@"%d/%zd",self.index,self.datas.count];
    //从数组中取出字典
    NSDictionary *dict = self.datas[self.index - 1];
    //使用字典给属性赋值
    self.mianImage.image = [UIImage imageNamed:dict[@"icon"]];
    self.descLabel.text  = dict[@"desc"];
    //设置左右两边按钮是否可用
    self.leftB.enabled = (self.index != 1);
    self.rightB.enabled= (self.index != self.datas.count);
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
-(void)viewDidLoad
{
    self.index = 1;
    [self chengeImage];
}


@end
