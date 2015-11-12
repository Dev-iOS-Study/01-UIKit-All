01-UIKit-day04
==============
iOS学习之-UIKit-004([状态栏](#状态栏)、[应用程序启动图片](#应用程序启动图片)、[UIButton便捷属性](#uibutton便捷属性)、[图片放大过程](#图片放大过程)、[常用的内存管理](#常用的内存管理))

**项目名称**：超级猜图

##状态栏

    在iOS7中，状态栏默认情况下归控制器管理，比如状态栏的样式、状态栏的是否可见
    
    控制器通过重写以下方法来控制状态栏
    设置状态栏的样式
    -(UIStatusBarStyle)preferredStatusBarStyle;
    其中UIStatusBarStyleLightContent是白色样式
    
    设置状态栏的可见性
    - (BOOL)prefersStatusBarHidden;
    
    //隐藏状态栏
    - (BOOL)prefersStatusBarHidden
    {
         return YES;
    }
    //高亮状态栏
    -(UIStatusBarStyle)preferredStatusBarStyle{
        return UIStatusBarStyleLightContent;
    }


##应用程序启动图片

    一个app在启动过程中会全屏显示叫做Default.png的图片

    不用规格Default的使用场合
    Default.png：非retina-iPhone屏幕，320x480
    Default@2x.png：retina-iPhone屏幕，640x960
    Default-568h@2x.png：4inch的retina-iPhone屏幕，640x1136
    Default-Portrait~ipad.png：非retain-iPad竖屏屏幕，768x1024
    Default-Portrait~ipad@2x.png：retain-iPad竖屏屏幕，1536x2048
    Default-Landscape~ipad.png：非retain-iPad横屏屏幕，1024x768
    Default-Landscape~ipad@2x.png：retain-iPad横屏屏幕，2048x1536
  
##UIButton便捷属性
  
    UIButton有很多种状态，它提供了一些便捷属性，可以直接获取当前状态下的文字、文字颜色、图片等
    @property(nonatomic,readonly,retain) NSString *currentTitle; 
    @property(nonatomic,readonly,retain) UIColor  *currentTitleColor;        
    @property(nonatomic,readonly,retain) UIImage  *currentImage;             
    @property(nonatomic,readonly,retain) UIImage  *currentBackgroundImage;

##图片放大过程
    1.增加遮盖view
    2.将图片移动到视图的顶层
    [self.view bringSubviewToFront:self.imageView];

    3.计算图片的目标位置，动画显示

##常用的内存管理

    strong  -  OC对象
    weak    -  UI控件，代理对象
    assign  -  基本类型、数值类型、BOOL、结构体、枚举
    copy    -  字符串






