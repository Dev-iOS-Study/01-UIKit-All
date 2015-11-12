//
//  ViewController.m
//  01-超级猜图
//
//  Created by C_bin on 15/11/8.
//  Copyright © 2015年 C_bin. All rights reserved.
//

#import "ViewController.h"
#import "CBQuestion.h"

@interface ViewController ()

//strong  oc对象
//weak    UI控件，代理对象
//assgin  基本类型  数值类型 BOOL 结构体  枚举
//copy    字符串

#pragma mark -
#pragma mark 视图属性
@property (weak,nonatomic) IBOutlet UILabel  * countLabel;
@property (weak,nonatomic) IBOutlet UIButton * coinButton;
@property (weak,nonatomic) IBOutlet UILabel  * titleLabel;
@property (weak,nonatomic) IBOutlet UIButton * iconButton;
@property (weak, nonatomic) IBOutlet UIButton *nextView;
@property (weak, nonatomic) IBOutlet UIView *answersView;
@property (weak, nonatomic) IBOutlet UIView *optionsView;


#pragma mark -
#pragma mark 声明属性
//记录图片的原始位置
@property (assign,nonatomic) CGRect oldFrame;

//遮盖的按钮
@property (weak,nonatomic) UIButton *coverButton;

//加载plist数据 模型
@property (nonatomic,strong) NSArray *questions;

//记录索引
@property (nonatomic,assign) int index;

#pragma mark -
#pragma mark 声明行为
-(IBAction)tipClick;
-(IBAction)helpClick;
-(IBAction)bigImageClick;
-(IBAction)nextClick;

-(IBAction)iconClick;

@end

@implementation ViewController

#pragma mark -
#pragma mark 覆盖controller自带方法
//状态栏由controller控制
//#pragma mark 隐藏状态栏
//-(BOOL)prefersStatusBarHidden
//{
//    return YES;
//}
//#pragma mark 高亮状态栏
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
//视图加载完成
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //3.代码写得比较多了，必须要测试
    //    NSLog(@"%@",self.questions);
    //    [self.iconButton setImage:[UIImage imageNamed:@"gj"] forState:UIControlStateNormal];
    
    self.index--;
    [self nextClick];
}

#pragma mark -
#pragma mark 属性方法
//2 懒加载
-(NSArray *) questions
{
    if (_questions == nil) {
        _questions = [CBQuestion questionsList];
    }
    return _questions;
}

#pragma mark -
#pragma mark 行为事件方法
//大图行为，放大图片
-(IBAction)bigImageClick
{
    //记录原始的frame
    if (self.oldFrame.size.width == 0) {
        self.oldFrame = self.iconButton.frame;
    }
    
    //1.1放大
    CGFloat iconW = self.view.frame.size.width;
    CGFloat iconH = iconW;
    CGFloat iconX = 0;
    CGFloat iconY = (self.view.frame.size.height - iconH) / 2;
    
    //1.3生成遮盖按钮
    UIButton *coverButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:coverButton];
    
    self.coverButton = coverButton;
    
    coverButton.frame = self.view.bounds;
    coverButton.backgroundColor = [UIColor blackColor];
    coverButton.alpha = 0;
    
    //1.4 把一个子控件置于顶层
    [self.view bringSubviewToFront:self.iconButton];
    
    
    //1.2动画
    [UIView animateWithDuration:1.0 animations:^{
        self.iconButton.frame = CGRectMake(iconX, iconY, iconW, iconH);
        coverButton.alpha = 0.5;
    }];
    
    //1.5点击遮盖层 缩小图像
    [coverButton addTarget:self action:@selector(smallImageClick) forControlEvents:UIControlEventTouchUpInside];
}
//点击图片行为，放大缩小图片
-(IBAction)iconClick
{
    if (self.coverButton == nil) {
        [self bigImageClick];
    }else{
        [self smallImageClick];
    }
}
//点击下一题行为
-(IBAction)nextClick
{
    self.index++;
    //取模型数据
    CBQuestion *question =  self.questions[self.index];
    //5.1 给子宫件赋值
    self.countLabel.text = [NSString stringWithFormat:@"%d/%lu",self.index+1,(unsigned long)self.questions.count];
    self.titleLabel.text = question.title;
    //使用button.imageView.image设置图片没反应，用setIamge: forState:
//    self.iconButton.imageView.image = [UIImage imageNamed:question.icon];
    [self.iconButton setImage:[UIImage imageNamed:question.icon] forState:UIControlStateNormal];
    
    NSLog(@"%@",self.iconButton.imageView.image);
    
//    if ((self.index + 1) == self.questions.count) {
//        self.nextView.enabled = NO;
//    }
    
    self.nextView.enabled = (self.index + 1) != self.questions.count;
    
    //5.2生成答案按钮
    [self addAnswerButtons:question];
    //5.3生成选项按钮
    
}
//提示行为
-(IBAction)tipClick
{
    
}
//帮助行为
-(IBAction)helpClick
{
    
}

#pragma mark -
#pragma mark -代码抽取
//1.5点击遮盖层 缩小图像
// 来自方法（bigImageClick、iconClick）
-(void) smallImageClick
{
    [UIView animateWithDuration:1.0 animations:^{
        self.iconButton.frame = self.oldFrame;
        self.coverButton.alpha = 0;
    } completion:^(BOOL finished) {
        //当动画完成之后，移除遮盖按钮
        [self.coverButton removeFromSuperview];
    }];
}

//动态添加按钮 - 来自方法（nextClick）
-(void)addAnswerButtons:(CBQuestion*)question
{
    //删除上一题的按钮
    //    for (UIButton *btn in self.answersView.subviews) {
    //        [btn removeFromSuperview];
    //    }
    //让数组的每一个元素执行某方法。
    [self.answersView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSUInteger count = question.answer.length;
    for (int i=0; i < count; i++) {
        UIButton *answerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.answersView addSubview:answerBtn];
        
        //设置frame
        CGFloat margin = 10;
        CGFloat answerW = 35;
        CGFloat answerH = 35;
        CGFloat marginLeft = (self.answersView.frame.size.width - count * answerW - (count-1)*margin) / 2;
        CGFloat answerY = 0;
        CGFloat answerX = marginLeft + i * (answerW + margin);
        
        answerBtn.frame = CGRectMake(answerX, answerY, answerW, answerH);
        
        [answerBtn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [answerBtn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
    }
}

//动态添加选项按钮
//来自方法 （nextClick）
-(void)addOptionButtons:(CBQuestion*)question
{
    for (int i=0; i < question.options.count; i++) {
        UIButton *optionBtn = [UIButton buttonWithType:UIControlStateNormal];
        [self.optionsView addSubview:optionBtn];
        
    }
    
}


@end
