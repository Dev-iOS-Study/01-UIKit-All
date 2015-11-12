//
//  ViewController.m
//  03-图片浏览器(使用数组进行数据封装)
//
//  Created by C_bin on 15/11/3.
//  Copyright © 2015年 C_bin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//链接storyboard控件
- (IBAction)blink;
@property (weak,nonatomic) IBOutlet UILabel *indexLable;
@property (weak,nonatomic) IBOutlet UILabel *descLable;
@property (weak,nonatomic) IBOutlet UIImageView *ImageView;
@property (weak,nonatomic) IBOutlet UIButton *LeftB;
@property (weak,nonatomic) IBOutlet UIButton *rightB;

//属性
@property (strong,nonatomic) NSArray *data;
@property (nonatomic,assign) int index;

//行为
-(IBAction)previous;
-(IBAction)next;

@end    /*---------------------------------*/

@implementation ViewController

//界面加载完成
-(void)viewDidLoad
{
    self.index = 1;
    [self chengeImage];
}

#pragma mark 使用懒加载的方式初始化数据（数据只有用到了才去加载，节约内存空间）
-(NSArray *)data
{
    if(_data == nil){
        NSDictionary *dict1 = @{@"icon":@"biaoqingdi",@"desc":@"在他面前，其他神马表情都弱爆了！"};
        NSDictionary *dict2 = @{@"icon":@"wangba",@"desc":@"哥们为什么选八号呢"};
        NSDictionary *dict3 = @{@"icon":@"bingli",@"desc":@"这也忒狠了！"};
        NSDictionary *dict4 = @{@"icon":@"chiniupa",@"desc":@"这小姑娘吃个牛排比杀牛还费劲啊！"};
        NSDictionary *dict5 = @{@"icon":@"danteng",@"desc":@"亲，你能改下你的网名么？哈哈！"};
        self.data = @[dict1,dict2,dict3,dict4,dict5];
    }
    return _data;
}

//行为
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

#pragma mark 私用方法
//重复代码提取
-(void)chengeImage
{
    self.indexLable.text =[NSString stringWithFormat:@"%d/%zd",self.index,self.data.count];
    //从数组中取出字典
    NSDictionary *dict = self.data[self.index - 1];
    //使用字典给属性赋值
    self.ImageView.image = [UIImage imageNamed:dict[@"icon"]];
    self.descLable.text  = dict[@"desc"];
    //设置左右两边按钮是否可用
    self.LeftB.enabled = (self.index != 1);
    self.rightB.enabled = (self.index != self.data.count);
}

- (IBAction)blink {
}
@end
