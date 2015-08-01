#import "sb_user_video_item.h"
#import <MediaPlayer/MediaPlayer.h>


@interface sb_user_video_item ()
{
    /// 视频播放组件对象
    MPMoviePlayerController *movie;
    /// 图片播放按钮对象
    UIImageView *imagePlay;
    /// 图片删除按钮对象
    UIImageView *imageDelete;
    /// 文件名标签
    UILabel *labelFileName;
}
@end

@implementation sb_user_video_item

@synthesize videoFilePath;

/// 初始化视图
- (void)initView {
    [self setBackgroundColor:UICOLORRGBA(0.8, 0.5, 0, 0.9)];
    [sfe_screen drawBorder:self BorderColor:(CGFloat[]){1,1,1,0.9} BorderWidth:1 BorderRadius:0];
    
    // 初始化播放组件对象
    movie = [[MPMoviePlayerController alloc]init];
    [movie.view setFrame:[self bounds]];
    [movie setControlStyle:MPMovieControlStyleEmbedded];
    [movie setScalingMode:MPMovieScalingModeAspectFit];
    [movie setInitialPlaybackTime:-1];
    // 注册一个播放结束的通知
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(videoPlayCompleted:)
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:movie];
    [self addSubview:movie.view];
    [movie.view setHidden:TRUE];
    
    // 初始化图片播放按钮
    int offsetPlay = 4;
    CGRect imagePlayRect = CGRectMake(
        (self.bounds.size.width - self.bounds.size.height / offsetPlay) / 2,
        (self.bounds.size.height - self.bounds.size.height / offsetPlay) / 2,
        self.bounds.size.height / offsetPlay,
        self.bounds.size.height / offsetPlay);
    imagePlay = [[UIImageView alloc]initWithFrame:imagePlayRect];
    [imagePlay setImage:[sfe_image imageBy:@"Resource/Images/VideoDiary/videodiary-4.png"]];
    [imagePlay setUserInteractionEnabled:TRUE];
    [imagePlay addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imagePlayClick)]];
    [self addSubview:imagePlay];
    
    // 初始化图片删除按钮
    int offsetDelete = 8;
    CGRect imageDeleteRect = CGRectMake(
        (self.bounds.size.width - self.bounds.size.height / offsetDelete) - 2,
        (self.bounds.size.height - self.bounds.size.height / offsetDelete) - offsetDelete,
        self.bounds.size.height / offsetDelete,
        self.bounds.size.height / offsetDelete + 3);
    imageDelete = [[UIImageView alloc]initWithFrame:imageDeleteRect];
    [imageDelete setImage:[sfe_image imageBy:@"Resource/Images/VideoDiary/videodiary-6.png"]];
    [imageDelete setUserInteractionEnabled:TRUE];
    [imageDelete addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageDeleteClick)]];
    [self addSubview:imageDelete];
    
    // 初始化文件名标签
    CGRect labelFileNameRect = CGRectMake(
            5,
            5,
            self.bounds.size.width,
            30);
    labelFileName = [[UILabel alloc]initWithFrame:labelFileNameRect];
    //[labelFileName setTextAlignment:NSTextAlignmentCenter];
    [labelFileName setFont:[UIFont fontWithName:DEFAULTFONTNAMEBOLD size:12]];
    [labelFileName setText:[NSString stringWithFormat:@"文件：%@",[videoFilePath lastPathComponent]]];
    [labelFileName setTextColor:[UIColor whiteColor]];
    [self addSubview:labelFileName];
}

/// 图片播放按钮点击事件
- (void)imagePlayClick {
    if (![sfe_file isBlankString:videoFilePath]) {
        [imagePlay setHidden:TRUE];
        //视频文件路径
        NSString *path = [[NSBundle mainBundle] pathForResource:videoFilePath ofType:@"mp4"];
        //视频URL
        NSURL *url = [NSURL fileURLWithPath:path];
        [movie setContentURL:url];
        [movie.view setHidden:FALSE];
        [movie play];
    } else {
        [sfe_screen messageBox:self Text:@"亲，没有可播放的视频文件哦！"];
    }
}

/// 图片删除按钮点击事件
- (void)imageDeleteClick {
    [sfe_screen messageBox:self Text:@"删除文件"];
}

/// 视频播放完成后触发的事件
- (void)videoPlayCompleted:(NSNotification *)sender {
    // 获取播放结束原因
    NSNumber *reason = [[sender userInfo]objectForKey:MPMoviePlayerPlaybackDidFinishReasonUserInfoKey];
    switch ([reason intValue]) {
        // 播放结束
        case MPMovieFinishReasonPlaybackEnded:
            [imagePlay setHidden:FALSE];
            [movie.view setHidden:TRUE];
            break;
        // 播放错误
        case MPMovieFinishReasonPlaybackError:
            [movie.view setHidden:TRUE];
            [sfe_screen messageBox:self Text:@"文件播放格式错误！"];
            [imagePlay setHidden:TRUE];
            break;
        // 播放退出
        case MPMovieFinishReasonUserExited:
            [imagePlay setHidden:FALSE];
            [movie.view setHidden:TRUE];
            break;
    }
}

@end




















