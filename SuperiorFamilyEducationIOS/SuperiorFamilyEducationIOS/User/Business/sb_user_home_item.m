#import "sb_user_home_item.h"


@interface sb_user_home_item() <UITableViewDataSource, UITableViewDelegate>
{
    
}
@end

@implementation sb_user_home_item

@synthesize labelAgeAndDate, labelNick, imageDataView, imageArrowUp, \
imageArrowDown, textDataView, buttonEmbrace, buttonComment, labelEmbrace, \
tableComment, textReply;


/// 初始化视图
- (void)initView {
    [self setBackgroundColor:DEFAULTBACKCOLOR];
    [self setUserInteractionEnabled:TRUE];
    
    self.tableComment.delegate = self;
    self.tableComment.dataSource = self;
    
    // 添加图片点击事件
    [imageArrowDown setUserInteractionEnabled:TRUE];
    [imageArrowDown addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageArrowDownClick)]];
    [imageArrowUp setUserInteractionEnabled:TRUE];
    [imageArrowUp addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageArrowUpClick)]];
    // 设置向上向下按钮的隐藏和现实
    [imageArrowDown setHidden:FALSE];
    [imageArrowUp setHidden:TRUE];
  
    [sfe_screen drawBorder:textDataView BorderColor:(CGFloat[]){0.8,0.8,0.8,0.9} BorderWidth:1 BorderRadius:5];
    [sfe_screen drawBorder:textReply BorderColor:(CGFloat[]){0.8,0.8,0.8,0.9} BorderWidth:1 BorderRadius:5];
}

/// 向下图片点击事件
- (void)imageArrowDownClick {
    [imageArrowDown setHidden:TRUE];
    [imageArrowUp setHidden:FALSE];
}

/// 向上图片点击事件
- (void)imageArrowUpClick {
    [imageArrowDown setHidden:FALSE];
    [imageArrowUp setHidden:TRUE];
}

/// 拥抱按钮点击事件
- (IBAction)buttonEmbraceClick:(id)sender {
    [sfe_screen messageBox:self Text:@"你点击了拥抱按钮"];
}

/// 评论按钮点击事件
- (IBAction)buttonCommentClick:(id)sender {
    [sfe_screen messageBox:self Text:@"你点击了评论按钮"];
}

//// 列表有多少个组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

/// 第section组一共有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

/// 返回每一行显示的内容(每一行显示怎样的cell)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 获取indexPath.row行数据单元列对象
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    // 从集合中取出对应行数数据
    NSString *text = self.dataArray[indexPath.row];
    // 添加行数据
    UILabel *labelCell = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, cell.bounds.size.width, cell.bounds.size.height)];
    [labelCell setFont:[UIFont fontWithName:DEFAULTFONTNAMEBOLD size:16]];
    // 设置双色字体
    [labelCell setAttributedText:[sfe_file divisionFontColor:text Spliter:@"：" Colors:[[NSArray alloc]initWithObjects:[UIColor redColor],[UIColor blueColor],nil]]];
    [cell addSubview:labelCell];
    
    return cell;
}

/// 表格点击事件
- (void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSLog(@"\ndidSelectRowAtIndexPath \n");
}

@end






































