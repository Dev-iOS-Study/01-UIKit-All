01-UIKit-day03
==============
iOS学习之-UIKit-002（模型、Xib、九宫格、instancetype、plist、UIFont、UIButton）

**项目名称**：应用管理

##模型

 ![alt text](/资料/images/字典转模型的好处.png "字典转模型的好处")

   字典转模型的过程最好封装在模型内部
   
   模型应该提供一个可以传入字典参数的构造方法
   
   `-` (instancetype)initWithDict:(NSDictionary *)dict;
   
   `+` (instancetype)xxxWithDict:(NSDictionary *)dict;

![alt text](/资料/images/字典转模型过程.png "字典转模型过程")

##Xib文件的使用

    Xib文件可以用来描述某一块局部的UI界面
    方法1
    NSArray *objs = [[NSBundle mainBundle] loadNibNamed:@"MJAppView" owner:nil options:nil];
    这个方法会创建xib中的所有对象，并且将对象按顺序放到objs数组中
    方法2
    bundle参数可以为nil，默认就是main bundle
    UINib *nib = [UINib nibWithNibName:@"MJAppView" bundle:[NSBundle mainBundle]];
    NSArray *objs = [nib instantiateWithOwner:nil options:nil];
    在开发阶段,面向开发者的是xib文件; 当把应用装到手机上时,xib文件就会转为nib文件
    要想随意调整xib中view的尺寸，首先要设置size为Freeform

##搭建九宫格的步骤

    明确每一块用的是什么view
    明确每个view之间的父子关系
    先尝试逐个逐个添加格子，最后考虑使用for循环
    加载app数据，根据数据长度创建对应个数的格子
    添加格子内部的子控件
    给格子内部的子控件装配数据

##instancetype

    instancetype在类型表示上，跟id一样，可以表示任何对象类型
    instancetype只能用在返回值类型上，不能像id一样用在参数类型上
    instancetype比id多一个好处：编译器会检测instancetype的真实类型

##plist文件加载

    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path   = [bundle pathForResource:@"appInfo" ofType:@"plist"];
    NSArray  *array  = [NSArray arrayWithContentsOfFile:path];

##UIFont

    UIFont代表字体，常见创建方法有以下几个：
    + (UIFont *)systemFontOfSize:(CGFloat)fontSize;   系统默认字体
    + (UIFont *)boldSystemFontOfSize:(CGFloat)fontSize;  粗体
    + (UIFont *)italicSystemFontOfSize:(CGFloat)fontSize;  斜体

##UIButton的常见设置

    - (void)setTitle:(NSString *)title forState:(UIControlState)state;
    设置按钮的文字

    - (void)setTitleColor:(UIColor *)color forState:(UIControlState)state;
    设置按钮的文字颜色

    - (void)setImage:(UIImage *)image forState:(UIControlState)state; 
    设置按钮内部的小图片

    - (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state;
    设置按钮的背景图片

    设置按钮的文字字体（需要拿到按钮内部的label来设置）
    btn.titleLabel.font = [UIFont systemFontOfSize:13];

    - (NSString *)titleForState:(UIControlState)state; 
    获得按钮的文字

    - (UIColor *)titleColorForState:(UIControlState)state;
    获得按钮的文字颜色

    - (UIImage *)imageForState:(UIControlState)state;
    获得按钮内部的小图片

    - (UIImage *)backgroundImageForState:(UIControlState)state;
    获得按钮的背景图片
