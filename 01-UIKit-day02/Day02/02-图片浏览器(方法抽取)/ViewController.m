//
//  ViewController.m
//  01-图片浏览器
//
//  Created by C_bin on 15/7/27.
//  Copyright (c) 2015年 C_bin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,weak)   IBOutlet    UILabel     *indexLabel;
@property(nonatomic,weak)   IBOutlet    UIImageView *mainImageView;
@property(nonatomic,weak)   IBOutlet    UILabel     *descLabel;
@property(nonatomic,weak)   IBOutlet    UIButton    *leftBtn;
@property(nonatomic,weak)   IBOutlet    UIButton    *rightBtn;
@property(nonatomic,assign) int         index;

-(IBAction) next;
-(IBAction) previous;

@end //ViewContrller()

//------------------------------------------//

@implementation ViewController

-(void)viewDidLoad
{
    self.index = 1;
    [self chengeImage];
    
}   //-viewDidLoad

-(IBAction)next
{
    self.index++;
    [self chengeImage];
}   //-next


-(IBAction)previous
{
    self.index--;
    [self chengeImage];
}   //-previous


//把重复的代码封装到一个方法中，减少代码的重复，提高代码的可维护性。
- (void)chengeImage
{
    
    self.indexLabel.text = [NSString stringWithFormat:@"%d/5",self.index];
    
    switch (self.index) {
        case 1:
            self.mainImageView.image = [UIImage imageNamed:@"biaoqingdi"];
            self.descLabel.text  = @"在他面前，其他神马表情都弱爆了！";
            break;
        case 2:
            self.mainImageView.image = [UIImage imageNamed:@"wangba"];
            self.descLabel.text = @"哥们为什么选八号呢";
            break;
        case 3:
            self.mainImageView.image = [UIImage imageNamed:@"bingli"];
            self.descLabel.text = @"这也忒狠了";
            break;
        case 4:
            self.mainImageView.image = [UIImage imageNamed:@"chiniupa"];
            self.descLabel.text = @"这小姑娘吃个牛排比杀牛还费劲啊";
            break;
        case 5:
            self.mainImageView.image = [UIImage imageNamed:@"danteng"];
            self.descLabel.text = @"亲，你能改下你的网名么？哈哈";
            break;
        default:
            break;
    }
    
    //控制左右按钮是否可用
    self.leftBtn.enabled = (self.index != 1);
    self.rightBtn.enabled = (self.index != 5);

}   //-chengeImage


@end
