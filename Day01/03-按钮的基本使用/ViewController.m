//
//  ViewController.m
//  03-按钮的基本使用
//
//  Created by C_bin on 15/7/26.
//  Copyright (c) 2015年 C_bin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/**头像按钮*/
@property (nonatomic,weak) IBOutlet UIButton * headBtn;
//上移
-(IBAction)up;
//下移
-(IBAction)buttom;
//左移
-(IBAction)left;
//右移
-(IBAction)right;

//缩小
-(IBAction)small;
//放大
-(IBAction)big;

@end

@implementation ViewController

//上移
-(IBAction)up{
    CGRect frame = self.headBtn.frame;
    frame.origin.y -= 2;
    self.headBtn.frame = frame;
}
//下移
-(IBAction)buttom{
    CGRect frame = self.headBtn.frame;
    frame.origin.y += 2;
    self.headBtn.frame = frame;
}
//左移
-(IBAction)left{
    CGRect frame = self.headBtn.frame;
    frame.origin.x -= 2;
    self.headBtn.frame = frame;
}
//右移
-(IBAction)right{
    CGRect frame = self.headBtn.frame;
    frame.origin.x += 2;
    self.headBtn.frame = frame;
}

//缩小
-(IBAction)small{
    CGRect bounds = self.headBtn.bounds;
    bounds.size.height -= 2;
    bounds.size.width -= 2;
    self.headBtn.bounds = bounds;
}
//放大
-(IBAction)big{
    CGRect bounds = self.headBtn.bounds;
    bounds.size.height += 2;
    bounds.size.width += 2;
    self.headBtn.bounds = bounds;
}

@end
