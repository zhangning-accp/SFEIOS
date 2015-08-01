#import "sfe_define.h"



/**
 功能：用户主页展示页数据展示控件
 说明：用于展示用户信息、评论、视频、图片等数据
 作者：庄鹏飞
 日期：2015-07-22
 */
@interface sb_user_home_item : UIView

/// 年龄、日期标签
@property (nonatomic, strong) IBOutlet UILabel *labelAgeAndDate;
/// 称呼标签
@property (nonatomic, strong) IBOutlet UILabel *labelNick;
/// 图片数据视图
@property (nonatomic, strong) IBOutlet UIImageView *imageDataView;
/// 向上图片按钮
@property (nonatomic, strong) IBOutlet UIImageView *imageArrowUp;
/// 向下图片按钮
@property (nonatomic, strong) IBOutlet UIImageView *imageArrowDown;
/// 图片数据附加信息
@property (nonatomic, strong) IBOutlet UITextView *textDataView;
/// 拥抱按钮
@property (nonatomic, strong) IBOutlet UIButton *buttonEmbrace;
/// 评论按钮
@property (nonatomic, strong) IBOutlet UIButton *buttonComment;
/// 拥抱信息标签
@property (nonatomic, strong) IBOutlet UILabel *labelEmbrace;
/// 评论列表
@property (nonatomic, strong) IBOutlet UITableView *tableComment;
/// 回复或评论输入框
@property (nonatomic, strong) IBOutlet UITextView *textReply;

/// 数据集合
@property (nonatomic, nullable) NSArray *dataArray;

/// 初始化
- (void)initView;

/// 拥抱按钮点击事件
- (IBAction)buttonEmbraceClick:(id)sender;
/// 评论按钮点击事件
- (IBAction)buttonCommentClick:(id)sender;

@end
