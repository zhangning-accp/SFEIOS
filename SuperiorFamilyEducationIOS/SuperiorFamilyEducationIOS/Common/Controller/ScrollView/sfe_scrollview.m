#import "sfe_scrollview.h"
#import <MediaPlayer/MediaPlayer.h>


@interface sfe_scrollview ()
{
    /// 视图集合
    NSMutableArray<UIView *> *viewArray;
    /// 视频播放按钮
    UIImageView *imageVideoPlay;
    /// 删除按钮
    UIImageView *imageDelete;
    /// 滚动条组件
    UIScrollView *scrollView;
}
@end

@implementation sfe_scrollview

@synthesize dataSource, backgroundColor;

/**
 功能：
    初始化视图
 时间：2015-07-31
 */
- (void)initView {
    CGRect rootRect = self.bounds;
    if (backgroundColor == nil) {
        backgroundColor = DEFAULTBACKCOLOR;
    }
    
    // 初始化滚动条
    CGRect scrollViewRect = CGRectMake(0, 0, rootRect.size.width, rootRect.size.height);
    scrollView = [[UIScrollView alloc]initWithFrame:scrollViewRect];
    [scrollView setContentSize:CGSizeMake(rootRect.size.width * [dataSource count], 0)];
    [scrollView setDelegate:self];
    [scrollView setPagingEnabled:YES];
    [self addSubview:scrollView];
    
    // 批量添加数据层视图
    for (NSInteger i = 0; i < [dataSource count]; i++) {
        CGRect viewRect = CGRectMake(0, 0, scrollViewRect.size.width, scrollViewRect.size.height);
        UIView *view = [[UIView alloc]initWithFrame:viewRect];
        [view setBackgroundColor:backgroundColor];
        [viewArray addObject:view];
        [self addSubview:view];
        
        EnumFileType type = [sfe_file verificationExtension:dataSource[i]];
        if (type == EFT_Image) {
            
        } else if (type == EFT_Video) {
            // 初始化播放组件对象
            MPMoviePlayerController *movie = [[MPMoviePlayerController alloc]init];
            [movie.view setFrame:viewRect];
            [movie setControlStyle:MPMovieControlStyleEmbedded];
            [movie setScalingMode:MPMovieScalingModeAspectFit];
            [movie setInitialPlaybackTime:-1];
            // 注册一个播放结束的通知
            [[NSNotificationCenter defaultCenter]
             addObserver:self
             selector:@selector(videoPlayCompleted:)
             name:MPMoviePlayerPlaybackDidFinishNotification
             object:movie];
            [view addSubview:movie.view];
            [movie.view setHidden:TRUE];
        } else if (type == EFT_Audio) {
            
        }
    }
}

/// 视频播放完成后触发的事件
- (void)videoPlayCompleted:(NSNotification *)sender {
    MPMoviePlayerController *movie = [sender object];
}

/**
 功能：
    获取指定索引位置视图对象
 参数说明：
    index 索引位置
 返回值：
    视图对象
 时间：2015-07-31
 */
- (nonnull UIView *)getViewAt:(NSInteger)index {
    if (viewArray == nil || [viewArray count] == 0) {
        return nil;
    }
    if (index < 0) {
        index = 0;
    }
    if (index > [viewArray count] - 1) {
        index = [viewArray count] - 1;
    }
    return viewArray[index];
}

@end
