#import "sfe_screen.h"



@interface sfe_screen()
{
    // 页面跳转设备上下文
    id contextId;
}
@end

@implementation sfe_screen

/**
 功能：
    获取屏幕坐标、大小
 返回值：
    屏幕坐标、大小
 时间：2015-07-17
 */
+ (CGRect)getScreenRect {
    return [[UIScreen mainScreen]bounds];
}

/**
 功能：
    绘制控件边框
 参数说明：
    control: 要绘制的控件
    color: 边框颜色[R,G,B,A]
    width: 边框宽度
    radius: 边框圆角半径
 时间：2015-07-17
 */
+ (void)drawBorder:(nonnull UIControl *)control BorderColor:(CGFloat[4])color BorderWidth:(CGFloat)width BorderRadius:(CGFloat)radius {
    // 设置控件圆角边框
    [control.layer setMasksToBounds:TRUE];
    // 设置圆角半径
    [control.layer setCornerRadius:radius];
    // 设置边框宽度
    [control.layer setBorderWidth:width];
    // 设置边框颜色
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef borderColor = CGColorCreate(colorSpace, color);
    [control.layer setBorderColor:borderColor];
}

/**
 功能：
    页面跳转
 参数说明：
    context: 设备上下文对象
    IdenName: Identity 连线名称
 时间：2015-07-17
 */
- (nullable sfe_screen *)pageSkip:(nonnull id)context IdentityName:(nonnull NSString *)idenName {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.viewController = [storyBoard instantiateViewControllerWithIdentifier:idenName];
    contextId = context;
    return self;
}

/**
 功能：
    跳转页显示
 时间：2015-07-17
 */
- (void)show {
    if (self.viewController != nil && contextId != nil) {
        [contextId presentViewController:self.viewController animated:TRUE completion:nil];
    }
}

/**
 功能：
    弹出对话框
 参数说明：
    context: 设备上下文对象
    text: 要显示的文本
 时间：2015-07-17
 */
+ (void)messageBox:(nonnull id)context Text:(NSString *)text {
    if (context != nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:text delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil,nil];
        [alert show];
    }
}

/**
 功能：将controller压入到NavigationController里
 @param MainStoryBoardID:主启动的storyboardid
 @param controllerIdenName:需要被push的controller idenID
 @param navContr: UINavigationController.通常是self.navigationController.
 author:zn
 */
+(void)pushViewController:(nonnull NSString*) MainStoryBoardID IdentityName:(nonnull NSString *)controllerIdenName NavController:(nonnull UINavigationController*) navContr {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:MainStoryBoardID bundle:nil];
    UIViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:controllerIdenName];
    
    [navContr pushViewController:viewController animated:YES];
}


@end
