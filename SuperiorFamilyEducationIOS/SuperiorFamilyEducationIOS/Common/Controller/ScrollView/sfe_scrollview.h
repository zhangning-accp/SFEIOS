#import "sfe_define.h"


/**
 功能：ScrollView 控件
 说明：自定义滚动框控件
 作者：庄鹏飞
 日期：2015-7-31
 */
@interface sfe_scrollview : UIView <UIScrollViewDelegate>

/// 数据源
@property (nonatomic, strong, nullable) NSArray *dataSource;
/// 视图背景色
@property (nonatomic, strong, nullable) UIColor *backgroundColor;

/**
 功能：
    初始化视图
 时间：2015-07-31
 */
- (void)initView;

/**
 功能：
    获取指定索引位置视图对象
 参数说明：
    index 索引位置
 返回值：
    视图对象
 时间：2015-07-31
 */
- (nonnull UIView *)getViewAt:(NSInteger)index;

@end
