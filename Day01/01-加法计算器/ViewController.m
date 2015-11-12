//
//  ViewController.m
//  01-加法计算器
//
//  Created by C_bin on 15/7/25.
//  Copyright (c) 2015年 C_bin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *num1;
@property (weak, nonatomic) IBOutlet UITextField *num2;
@property (weak, nonatomic) IBOutlet UILabel *result;

- (IBAction)compute;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)compute {
    
    int num1 = self.num1.text.intValue;
    int num2 = self.num2.text.intValue;
    int sun = num1 + num2;
    self.result.text = [NSString stringWithFormat:@"%d",sun];
    
    //退出键盘的两种方法
    //1、resignFirstResponder 只有叫出键盘的那个控件调用这个方法才能退出键盘
    //[self.num1|num2 resignFisrtResponder];
    
    //2、只要是自己或自己的子控件叫出来的键盘，都可通过这个方法来退出键盘
    [self.view endEditing:YES];
    
}

@end
