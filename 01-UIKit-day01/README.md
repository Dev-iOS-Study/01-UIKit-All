01-UIKit-day01
==============
iOS学习之-UIKit-001（常见属性、UIButton、Keyboard退出）
  
##UIView的常见属性
**@property(nonatomic,readonly) UIView *superview;**
获得自己的父控件对象

**@property(nonatomic,readonly,copy) NSArray *subviews;**
获得自己的所有子控件对象

**@property(nonatomic) NSInteger tag;**
控件的ID\标识，父控件可以通过tag来找到对应的子控件

**@property(nonatomic) CGAffineTransform transform;**
控件的形变属性（可以设置旋转角度、比例缩放、平移等属性）

**@property(nonatomic) CGRect frame;**
控件所在矩形框在父控件中的位置和尺寸（以父控件的左上角为坐标原点）

**@property(nonatomic) CGRect bounds;**
控件所在矩形框的位置和尺寸（以自己左上角为坐标原点，所以bounds的x\y一般为0）

**@property(nonatomic) CGPoint center;**
控件中点的位置（以父控件的左上角为坐标原点）

**@property(nonatomic) CGRect frame;**
控件所在矩形框在父控件中的位置和尺寸（以父控件的左上角为坐标原点）

**@property(nonatomic) CGRect bounds;**
控件所在矩形框的位置和尺寸（以自己左上角为坐标原点，所以bounds的x\y一般为0）

**@property(nonatomic) CGPoint center;**
控件中点的位置（以父控件的左上角为坐标原点）

##UIButton

    // 1.创建一个自定义的按钮

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];

    // 2.添加按钮

    [self.view addSubview:btn];

    // 3.设置按钮的位置和尺寸

    btn.frame = CGRectMake(100, 100, 100, 100);

    // 4.监听按钮点击(点击按钮后就会调用self的btnClick方法)

    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];

    // 5.设置按钮在默认状态下的属性

    // 5.1.默认状态的背景

    [btn setBackgroundImage:[UIImage imageNamed:@"btn_01"] forState:UIControlStateNormal];

    // 5.2.默认状态的文字

    [btn setTitle:@"点我啊" forState:UIControlStateNormal];

    // 5.3.默认状态的文字颜色

    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

    // 6.设置按钮在高亮状态下的属性

    // 6.1.高亮状态的背景

    [btn setBackgroundImage:[UIImage imageNamed:@"btn_02"] forState:UIControlStateHighlighted];

    // 6.2.高亮状态的文字

    [btn setTitle:@"摸我干啥" forState:UIControlStateHighlighted];

    // 6.3.高亮状态的文字颜色

    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];

##退出键盘

    //退出键盘的两种方法
    
    //1、resignFirstResponder 只有叫出键盘的那个控件调用这个方法才能退出键盘
    
    [self.num1 resignFisrtResponder];
    
    //2、只要是自己或自己的子控件叫出来的键盘，都可通过这个方法来退出键盘
    
    [self.view endEditing:YES];
