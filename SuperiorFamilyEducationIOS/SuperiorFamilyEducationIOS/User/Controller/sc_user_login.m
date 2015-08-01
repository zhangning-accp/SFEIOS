#import "sc_user_login.h"
#import "sc_user_main.h"


@interface sc_user_login()
{
    /// 屏幕对象
    sfe_screen *screen;
}
@end

@implementation sc_user_login

/**
 功能：视图初始化方法
 日期：2015-7-17
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:DEFAULTBACKCOLOR];
    screen = [[sfe_screen alloc]init];

    // 设置标题背景
    [labelTitle setBackgroundColor:UICOLORIMAGE(@"Resource/Images/Login/3.png")];
    [labelTitle setTextColor:UICOLORRGBA(1, 1, 1, 0.8)];
    // 设置标题图片
    [imageTitle setImage:[sfe_image imageBy:@"Resource/Images/Login/8.png"]];
    // 设置账号图片
    [imageAccount setImage:[sfe_image imageBy:@"Resource/Images/Login/5.png"]];
    // 设置密码图片
    [imagePassword setImage:[sfe_image imageBy:@"Resource/Images/Login/6.png"]];
    // 设置登录按钮
    [buttonLogin setBackgroundImage:[sfe_image imageBy:@"Resource/Images/Login/7.png"] forState:UIControlStateNormal];
    [sfe_screen drawBorder:buttonLogin BorderColor:(CGFloat[]){0.3, 0.6, 0.9, 0.9} BorderWidth:1 BorderRadius:8];
}

/**
 功能：系统内存不足时，自动释放不用的资源
 日期：2015-7-17
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/// 登录按钮点击事件
- (IBAction)buttonLoginClickAction:(id)sender {
    sfe_screen *idenSkip = [screen pageSkip:self IdentityName:@"iden_main"];
    [idenSkip show];
}

@end
