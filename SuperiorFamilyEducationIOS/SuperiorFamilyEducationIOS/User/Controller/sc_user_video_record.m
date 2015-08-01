#import "sc_user_video_record.h"
#import <MediaPlayer/MediaPlayer.h>
#import "sb_user_video_item.h"


@interface sc_user_video_record () <UIScrollViewDelegate>
{
    /// 视频视图
    UIView *videoView;
    /// 滚动视图对象
    UIScrollView *videoScrollView;
    /// 视频集合
    NSArray *videoArray;
}
@end

@implementation sc_user_video_record

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:DEFAULTBACKCOLOR];
    CGRect viewRect = [sfe_screen getScreenRect];
    
    // 初始化头部视图
    CGRect headViewRect = CGRectMake(0, 0, viewRect.size.width, 50);
    UIView *headView = [[UIView alloc]initWithFrame:headViewRect];
    [headView setBackgroundColor:UICOLORIMAGE(@"Resource/Images/VideoDiary/videodiary-2.png")];
    [self.view addSubview:headView];
    
    // 初始化返回按钮
    CGRect imageBackRect = CGRectMake(5, (headViewRect.size.height - 35) / 2, 35, 35);
    UIImageView *imageBack = [[UIImageView alloc]initWithFrame:imageBackRect];
    [imageBack setContentMode:UIViewContentModeScaleToFill];
    //    [imageBack setImage:[sfe_image imageBy:@"Resource/Images/Diary/diary-2.png"]];
    [imageBack setBackgroundColor:[UIColor greenColor]];
    [imageBack setUserInteractionEnabled:TRUE];
    [imageBack addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageBackClick)]];
    [headView addSubview:imageBack];
    
    // 初始化头部标题
    CGRect labelTitleRect = CGRectMake(
                                       (headViewRect.size.width - 120) / 2,
                                       (headViewRect.size.height - 40) / 2,
                                       120,
                                       40);
    UILabel *labelTitle = [[UILabel alloc]initWithFrame:labelTitleRect];
    [labelTitle setText:@"添加记录"];
    [labelTitle setFont:[UIFont boldSystemFontOfSize:26]];
    [labelTitle setTextColor:[UIColor whiteColor]];
    [headView addSubview:labelTitle];
    
    // 记录文本框
    CGRect textDiaryRect = CGRectMake(0, headViewRect.origin.y + headViewRect.size.height, viewRect.size.width, 200);
    UITextView *textDiary = [[UITextView alloc]initWithFrame:textDiaryRect];
    [sfe_screen drawBorder:textDiary BorderColor:(CGFloat[]){0.3,0.6,0.9,0.75} BorderWidth:1 BorderRadius:3];
    [textDiary setFont:[UIFont systemFontOfSize:14]];
    [self.view addSubview:textDiary];
    
    // 照相按钮
    CGRect buttonPhotographRect = CGRectMake(viewRect.size.width / 4 - viewRect.size.width / 6 - 5, textDiaryRect.origin.y + textDiaryRect.size.height + 20, 70, 70);
    UIButton *buttonPhotograph = [[UIButton alloc]initWithFrame:buttonPhotographRect];
    [buttonPhotograph setBackgroundImage:[sfe_image imageBy:@"Resource/Images/videodiary/videodiary-5.png"] forState:UIControlStateNormal];
    [buttonPhotograph setFont:[UIFont systemFontOfSize:26]];
    [buttonPhotograph addTarget:self action:@selector(buttonPhotographClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonPhotograph];

    // 初始化视频视图
    CGRect videoViewRect = CGRectMake(10, buttonPhotographRect.origin.y + buttonPhotographRect.size.height + 10, viewRect.size.width * 0.94, viewRect.size.width * 0.6);
    videoView = [[UIView alloc]initWithFrame:videoViewRect];
    [videoView setBackgroundColor:[UIColor orangeColor]];
    [sfe_screen drawBorder:videoView BorderColor:(CGFloat[]){0.3,0.6,0.9,0.75} BorderWidth:1 BorderRadius:3];
    [self.view addSubview:videoView];
    
    
    ////////////// 添加测试数据开始 //////////////
    // 初始化视频集合
    videoArray = [[NSArray alloc]initWithObjects:@"Resource/Video/1", @"Resource/Video/2", @"Resource/Video/3", nil];
    
    // 初始化视频滚动视图
    CGRect videoScrollViewRect = CGRectMake(0, 0, videoViewRect.size.width, videoViewRect.size.height);
    videoScrollView = [[UIScrollView alloc]initWithFrame:videoScrollViewRect];
    [videoScrollView setContentSize:CGSizeMake(videoViewRect.size.width * [videoArray count], 0)];
    [videoScrollView setDelegate:self];
    [videoScrollView setPagingEnabled:YES];
    [videoView addSubview:videoScrollView];
    
    for (int i = 0; i < [videoArray count]; i++) {
        // 视频容器视图
        CGRect videoItemRect = CGRectMake(
            i * videoScrollViewRect.size.width,
            videoScrollViewRect.origin.y,
            videoScrollViewRect.size.width,
            videoScrollViewRect.size.height);
        sb_user_video_item *videoItem = [[sb_user_video_item alloc]initWithFrame:videoItemRect];
        [videoItem setVideoFilePath:videoArray[i]];
        [videoItem initView];
        [videoScrollView addSubview:videoItem];
    }

    ////////////// 添加测试数据结束 //////////////
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/// 返回图片按钮点击事件
- (void)imageBackClick {
    // 返回上一个页面
    [self dismissModalViewControllerAnimated:YES];
}

/// 照相按钮点击事件
- (void)buttonPhotographClick {
    NSLog(@"\nsc_user_video_record:buttonPhotographClick\n");
}

@end
