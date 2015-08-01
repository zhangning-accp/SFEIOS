#import "sfe_define.h"



/**
 功能：图片类
 作者：庄鹏飞
 说明：对图片的常用操作封装
 时间：2015-07-16
 */
@interface sfe_image : NSObject

/**
 功能：动态生成一幅图片
 参数说明：
    path：图片的虚拟路径
 返回值：图片对象
 时间：2015-07-16
 */
+ (nullable UIImage *)imageBy:(nonnull NSString *)path;

/**
 功能：
    动态生成一组图片动画
 参数说明：
    paths 组图片虚拟路径
    time 动画执行时间
    rect 动画视图大小，位置
 返回值：
    动画视图对象
 时间：2015-07-16
 */
+ (nullable UIImageView *)imageAnimation:(nonnull NSArray<NSString *> *)paths Duration:(CGFloat)time ViewRect:(CGRect)rect;

/**
 功能：
    图片滑动动画
 参数说明：
    context self或执行设备上下文
    images 图片集合
    action 要执行的方法
 时间：2015-07-16
 */
- (void)imageSlideAnimation:(nonnull id)context ImageArray:(nonnull NSArray *)images Action:(nonnull SEL)action;

@end
