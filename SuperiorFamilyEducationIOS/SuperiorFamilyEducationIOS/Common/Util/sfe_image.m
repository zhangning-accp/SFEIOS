#import "sfe_image.h"



@interface sfe_image()
{
    /// 图片集合
    NSArray *imageViewArray;
    /// 图片集合索引
    NSInteger imageIndex;
    /// 图片对象
    UIImageView *imageView;
    /// 执行设备对象
    id that;
    /// 执行方法
    SEL selfun;
}

/// 手势识别的回调函数
- (void)sgRecognizerAction:(UISwipeGestureRecognizer *)sender;
@end

@implementation sfe_image

/**
 功能：
    动态生成一幅图片
 参数说明：
    path：图片的虚拟路径
 返回值：
    图片对象
 时间：2015-07-16
 */
+ (UIImage *)imageBy:(NSString *)path {
    if ([sfe_file isBlankString:path]) {
        return nil;
    }
    // 生成一个UIImage对象
    UIImage *image = [UIImage imageNamed:path];
    return image;
}

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
+ (nullable UIImageView *)imageAnimation:(nonnull NSArray<NSString *> *)paths Duration:(CGFloat)time ViewRect:(CGRect)rect {
    if (paths == nil || paths.count == 0) {
        return nil;
    }
    
    NSMutableArray *imageArray = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i < paths.count; i++) {
        NSString *path = [paths objectAtIndex:i];
        UIImage *image = [UIImage imageNamed:path];
        [imageArray addObject:image];
    }
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:rect];
    [imageView setAnimationDuration:time];
    [imageView setAnimationImages:imageArray];
    [imageView startAnimating];
    
    return imageView;
}

/**
 功能：
    手势识别的回调函数
 时间：2015-07-16
 */
- (void)sgRecognizerAction:(UISwipeGestureRecognizer *)sender {
    // 如果方向是左滑动
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        if (imageIndex > imageViewArray.count - 2) {
            imageIndex = imageViewArray.count - 2;
            // 滑动最后一张后要做得操作
            if (selfun) {
                // 执行@selector类型方法
                [that performSelector:selfun withObject:nil afterDelay:-1];
            }
        } else if (imageIndex != imageViewArray.count - 1) {
            imageIndex++;
        }
        [UIView beginAnimations:nil context:nil];
        // 持续时间
        [UIView setAnimationDuration:1.0];
        // 在出动画的时候减缓速度
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        // 添加动画开始及结束的代理
        [UIView setAnimationDelegate:self];
        [UIView setAnimationWillStartSelector:@selector(begin)];
        [UIView setAnimationDidStopSelector:@selector(stop)];
        // 动画效果
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:((UIViewController *)that).view cache:YES];
        // 视图切换
        for (NSInteger i = 0; i < imageViewArray.count; i++) {
            if (imageIndex != i) {
                [[imageViewArray objectAtIndex:i]removeFromSuperview];
            } else {
                [((UIViewController *)that).view insertSubview:[imageViewArray objectAtIndex:i]atIndex:0];
            }
        }
        // 开始动画
        [UIView commitAnimations];
    }
    // 如果方向向右滑动
    else if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        if (imageIndex < 0) {
            imageIndex = 0;
        } else if (imageIndex != 0) {
            imageIndex--;
        }
        // 设置视图动画停止
        [UIView beginAnimations:nil context:nil];
        // 持续时间
        [UIView setAnimationDuration:1.0];
        // 在出动画的时候减缓速度
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        // 添加动画开始及结束的代理
        [UIView setAnimationDelegate:self];
        [UIView setAnimationWillStartSelector:@selector(begin)];
        [UIView setAnimationDidStopSelector:@selector(stop)];
        // 动画效果
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:((UIViewController *)that).view cache:YES];
        // 视图切换
        for (NSInteger i = 0; i < imageViewArray.count; i++) {
            if (imageIndex != i) {
                [[imageViewArray objectAtIndex:i]removeFromSuperview];
            } else {
                [((UIViewController *)that).view insertSubview:[imageViewArray objectAtIndex:i]atIndex:0];
            }
        }
        // 开始动画
        [UIView commitAnimations];
    }
}

/**
 功能：
    图片滑动动画
 参数说明：
    context self或执行设备上下文
    images 图片集合
    action 要执行的方法
 时间：2015-07-16
 */
- (void)imageSlideAnimation:(nonnull id)context ImageArray:(nonnull NSArray *)images Action:(nonnull SEL)action {
    if (context == nil || (images == nil || images.count == 0)) {
        return;
    }
    that = context;
    imageViewArray = images;
    imageIndex = 0;
    selfun = action;
    
    // 视图显示为视图集合的第一个
    [((UIViewController *)that).view bringSubviewToFront:[imageViewArray objectAtIndex:0]];
    
    // 添加手势识别
    UISwipeGestureRecognizer *sgRec;
    // 初始化手势并添加向右滑动手势
    sgRec = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(sgRecognizerAction:)];
    // 设置动作方向
    [sgRec setDirection:UISwipeGestureRecognizerDirectionRight];
    // 关联到视图
    [((UIViewController *)that).view addGestureRecognizer:sgRec];
    
    // 初始化手势并添加向左滑动手势
    sgRec = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(sgRecognizerAction:)];
    [sgRec setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [((UIViewController *)that).view addGestureRecognizer:sgRec];
}

@end
