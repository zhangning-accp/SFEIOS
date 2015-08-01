#import "sc_user_logo.h"


#define IMAGECOUNT 4

@interface sc_user_logo()
{
    /// 图片切换视图
    UIImageView *imageView;
    /// 视图集合
    NSMutableArray *imageViewArray;
    /// 当前视图的计数索引
    NSInteger viewIndex;
    
    /// 视图操作类对象
    sfe_screen *screen;
    /// 图片操作类对象
    sfe_image *image;
}

/// 页面跳转事件
- (void)pageSkipAction;
@end

@implementation sc_user_logo

/**
 功能：视图初始化方法
 日期：2015-7-17
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置VIEW背景色
    [self.view setBackgroundColor:DEFAULTBACKCOLOR];
    
    screen = [[sfe_screen alloc]init];
    image = [[sfe_image alloc]init];
    
    // 初始化计数索引
    viewIndex = 0;
    // 初始化视图集合
    imageViewArray = [[NSMutableArray alloc]init];
    // 获取屏幕大小
    CGRect rect = [sfe_screen getScreenRect];
    // 定义ImageView的大小
    CGRect imageViewRect = CGRectMake(0, 30, rect.size.width, rect.size.height);
    // 动态生成切换图片
    for (NSInteger i = 0; i < IMAGECOUNT; i++) {
        // 初始化每个图片视图
        imageView = [[UIImageView alloc]initWithFrame:imageViewRect];
        imageView.tag = i;
        // UIImageView 的 userInteractionEnabled 属性默认 "NO"，因此默认情况下，添
        //加在 UIImageView 中的 UIButton 将不发生触摸事件
        imageView.userInteractionEnabled = TRUE;
        UIImage *img = [sfe_image imageBy:[NSString stringWithFormat:@"Resource/Images/Logo/%ld.png",i + 1]];
        [imageView setImage:img];
        [imageViewArray addObject:imageView];
        [self.view addSubview:imageView];
    }
    
    // 添加图片滑屏效果
    [image imageSlideAnimation:self ImageArray:imageViewArray Action:@selector(pageSkipAction)];
}

/**
 功能：系统内存不足时，自动释放不用的资源
 日期：2015-7-17
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/**
 功能：页面跳转事件
 日期：2015-7-17
 */
- (void)pageSkipAction {
    [[screen pageSkip:self IdentityName:@"iden_login"]show];
}

@end
