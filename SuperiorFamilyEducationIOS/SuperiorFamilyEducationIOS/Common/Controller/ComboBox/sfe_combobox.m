#import "sfe_combobox.h"


@interface sfe_combobox () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation sfe_combobox

/// 初始化
- (void)initView {
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 20;
    labelText.text = self.selectedText = self.dataSource[self.selectedIndex];
    [imageArrowUp setHidden:TRUE];
    [tableView setHidden:TRUE];
    
    // 添加图片点击事件
    [imageArrowDown setUserInteractionEnabled:TRUE];
    [imageArrowDown addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageArrowDownClick)]];
    [imageArrowUp setUserInteractionEnabled:TRUE];
    [imageArrowUp addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageArrowUpClick)]];
}

- (void)imageArrowDownClick {
    [tableView setHidden:FALSE];
    [imageArrowDown setHidden:TRUE];
    [imageArrowUp setHidden:FALSE];
}

- (void)imageArrowUpClick {
    [tableView setHidden:TRUE];
    [imageArrowDown setHidden:FALSE];
    [imageArrowUp setHidden:TRUE];
}

// 列表有多少个组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// 第section组一共有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

// 返回每一行显示的内容(每一行显示怎样的cell)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 获取indexPath.row行数据单元列对象
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    // cell样式
    [cell setAccessoryType:UITableViewCellAccessoryNone];
    // 去掉选中cell时的蓝色背景
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    // 从集合中取出对应行数数据
    NSString *text = self.dataSource[indexPath.row];
    cell.textLabel.text = text;
    return cell;
}

/// 列表选择事件
-(void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    self.selectedIndex = [indexPath row];
    labelText.text = self.selectedText = self.dataSource[self.selectedIndex];
    //NSLog(@"\n%@\n", self.dataSource[self.selectedIndex]);
}

@end
