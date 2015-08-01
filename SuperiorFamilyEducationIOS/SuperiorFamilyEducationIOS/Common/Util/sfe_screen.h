#import "sfe_define.h"


/**
 功能：屏幕视图操作类
 说明：对屏幕、视图的常用操作封装
 时间：2015-07-17
 */
@interface sfe_screen : NSObject

/**
 功能：
    视图控制器
 时间：2015-07-17
 */
@property (nonatomic, nullable) UIViewController *viewController;

/**
 功能：
    获取屏幕坐标、大小
 返回值：
    屏幕坐标、大小
 时间：2015-07-17
 */
+ (CGRect)getScreenRect;

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
+ (void)drawBorder:(nonnull UIControl *)control BorderColor:(CGFloat[4])color BorderWidth:(CGFloat)width BorderRadius:(CGFloat)radius;

/**
 功能：
    页面跳转
 参数说明：
    context: 设备上下文对象
    IdenName: Identity 连线名称
 时间：2015-07-17
 */
- (nullable sfe_screen *)pageSkip:(nonnull id)context IdentityName:(nonnull NSString *)idenName;
/**
 功能：
    跳转页显示
 */
- (void)show;

/**
 功能：
    弹出对话框
 参数说明：
    context: 设备上下文对象
    text: 要显示的文本
 */
+ (void)messageBox:(nonnull id)context Text:(nullable NSString *)text;



@end
