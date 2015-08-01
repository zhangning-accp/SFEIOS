#import "sfe_define.h"



/**
 功能：用户登录页面控制器
 说明：用于验证用户登录
 作者：庄鹏飞
 日期：2015-7-17
 */
@interface sc_user_login : UIViewController
{
    /// 头部标题
    IBOutlet UILabel *labelTitle;
    /// 图片标题
    IBOutlet UIImageView *imageTitle;
    /// 账号图片
    IBOutlet UIImageView *imageAccount;
    /// 密码图片
    IBOutlet UIImageView *imagePassword;
    /// 账号输入框
    IBOutlet UITextField *textAccount;
    /// 密码输入框
    IBOutlet UITextField *textPassword;
    /// 账号注册
    IBOutlet UILabel *labelRegister;
    /// 登录按钮
    IBOutlet UIButton *buttonLogin;
}
/// 登录按钮点击事件
- (IBAction)buttonLoginClickAction:(id)sender;
@end
