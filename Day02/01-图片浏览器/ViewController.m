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

@implementation ViewController

-(void)viewDidLoad
{
    
    [super viewDidLoad];
    
    self.index = 1;
    self.indexLabel.text = [NSString stringWithFormat:@"%d/5",self.index];
    self.mainImageView.image = [UIImage imageNamed:@"biaoqingdi"];
    self.leftBtn.enabled = NO;
    self.descLabel.text  = @"在他面前，其他神马表情都弱爆了！";
    
}   //-viewDidLoad

-(IBAction)next
{
    
    self.index++;
    self.indexLabel.text = [NSString stringWithFormat:@"%d/5",self.index];
    
    switch (self.index) {
        case 2:
            self.mainImageView.image = [UIImage imageNamed:@"wangba"];
            self.descLabel.text = @"哥们为什么选八号呢";
            self.leftBtn.enabled = YES;
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
            self.rightBtn.enabled = NO;
            break;
        default:
            break;
    }
    
}   //-next

-(IBAction)previous
{
    
    self.index--;
    self.indexLabel.text = [NSString stringWithFormat:@"%d/5",self.index];
    
    switch (self.index) {
        case 1:
            self.mainImageView.image = [UIImage imageNamed:@"biaoqingdi"];
            self.descLabel.text = @"在他面前，其他神马表情都弱爆了！";
            self.leftBtn.enabled = NO;
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
            self.rightBtn.enabled = YES;
            break;

        default:
            break;
    }
    
}   //-previous

@end
