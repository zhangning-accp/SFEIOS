#import "sfe_define.h"


/**
 功能：ComboBox 控件
 说明：自定义下拉列表控件
 作者：庄鹏飞
 日期：2015-7-22
 */
@interface sfe_combobox : UIView
{
    IBOutlet UILabel *labelText;
    IBOutlet UITableView *tableView;
    IBOutlet UIImageView *imageArrowUp;
    IBOutlet UIImageView *imageArrowDown;
    IBOutlet UIView *headView;
}

/// 数据源
@property (nonatomic, strong, nullable) NSArray<NSString *> *dataSource;
/// 当前选中索引
@property (nonatomic) NSInteger selectedIndex;
/// 当前选中文本
@property (nonatomic, strong, nullable) NSString *selectedText;

/// 初始化
- (void)initView;

@end
