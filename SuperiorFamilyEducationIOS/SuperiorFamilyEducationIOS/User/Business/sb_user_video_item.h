#import "sfe_define.h"


/**
 功能：视频数据展示控件
 说明：用于展示用户视频数据
 作者：庄鹏飞
 日期：2015-07-30
 */
@interface sb_user_video_item : UIView

/// 视频文件路径
@property (nonatomic, strong, nullable) NSString *videoFilePath;

/// 初始化视图
- (void)initView;

@end
