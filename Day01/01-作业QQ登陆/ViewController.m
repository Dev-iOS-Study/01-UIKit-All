//
//  ViewController.m
//  01-作业QQ登陆
//
//  Created by C_bin on 15/7/25.
//  Copyright (c) 2015年 C_bin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *qqHao;
@property (weak, nonatomic) IBOutlet UITextField *qqMima;

-(IBAction)submit;
- (IBAction)textFiledReturnEditing:(id)sender;

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
-(IBAction)submit{
    
    NSLog(@"QQ号%@",self.qqHao.text);
    
    NSLog(@"QQ密码%@",self.qqMima.text);
    
    [self.view endEditing:YES];
    
}

- (IBAction)textFiledReturnEditing:(id)sender
{
    [sender resignFirstResponder];
    NSLog(@"T_T");
}

@end
