#import "sc_user_home.h"
#import "sb_user_home_item.h"
#import "sfe_combobox.h"


@interface sc_user_home ()
{
    /// 宝宝列表
    sfe_combobox *cbxBabyList;
    /// 宝宝头像
    UIImageView *babyFaceView;
    /// 视图项集合
    NSMutableArray *viewItemArray;
    /// 滚动视图对象
    UIScrollView *viewDataScroll;
}
@end

@implementation sc_user_home

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:DEFAULTBACKCOLOR];
    CGRect viewRect = [sfe_screen getScreenRect];

    NSArray *xibDataItem = [[NSBundle mainBundle]loadNibNamed:@"sb_user_home_item" owner:self options:nil];
    sb_user_home_item *dataItem = [xibDataItem objectAtIndex:0];
    [dataItem setFrame:CGRectMake(0, 10, viewRect.size.width, 300)];
    [dataItem initView];
    [self.view addSubview:dataItem];
    
    // 初始化顶部横幅
    CGRect headViewRect = CGRectMake(0, 0, viewRect.size.width, 50);
    UIView *headView = [[UIView alloc]initWithFrame:headViewRect];
    [headView setBackgroundColor:UICOLORRGBA(1, 0, 0, 0.95)];
    [headView setUserInteractionEnabled:TRUE];
    
    // 初始化宝宝头像
    CGRect babyFaceRect = CGRectMake(5, 2, 45, 45);
    babyFaceView = [[UIImageView alloc]initWithFrame:babyFaceRect];
    [babyFaceView setContentMode:UIViewContentModeScaleToFill];
    [babyFaceView setImage:[sfe_image imageBy:@"Resource/Images/Home/home-6.png"]];
    [headView addSubview:babyFaceView];
    
    // 初始化宝宝列表
    NSArray *xibBabyList = [[NSBundle mainBundle]loadNibNamed:@"sfe_combobox" owner:self options:nil];
    cbxBabyList = [xibBabyList objectAtIndex:0];
    NSArray *testBabyArray = [[NSArray alloc]initWithObjects:@"Baby-1", @"Baby-2", @"Baby-3", nil];
    [cbxBabyList setDataSource:testBabyArray];
    CGRect babyListRect = CGRectMake(80, 8, 200, cbxBabyList.dataSource.count * 40);
    [cbxBabyList setFrame:babyListRect];
    [cbxBabyList initView];
    [headView addSubview:cbxBabyList];
    [self.view addSubview:headView];
    
    // 添加一个底色视图面板
    CGRect mainViewRect = CGRectMake(
                                     0,
                                     headViewRect.size.height,
                                     viewRect.size.width,
                                     viewRect.size.height - headViewRect.size.height);
    UIView *mainView = [[UIView alloc]initWithFrame:mainViewRect];
    [mainView setBackgroundColor:DEFAULTBACKCOLOR];
    [self.view addSubview:mainView];
    
    // 初始化滚动视图
    CGRect viewDataScrollRect = CGRectMake(
                                           0,
                                           0,
                                           mainViewRect.size.width,
                                           mainViewRect.size.height);
    viewDataScroll = [[UIScrollView alloc]initWithFrame:viewDataScrollRect];
    [viewDataScroll setBackgroundColor:DEFAULTBACKCOLOR];
    [mainView addSubview:viewDataScroll];
    // 初始化视图项集合
    viewItemArray = [[NSMutableArray alloc]init];
    CGRect itemViewRect = CGRectMake(0, 0, 0, 0);
    
    /// 添加数据开始
    for (NSInteger i = 0; i < 10; i++) {
        NSArray *xibDataItem = [[NSBundle mainBundle]loadNibNamed:@"sb_user_home_item" owner:self options:nil];
        sb_user_home_item *dataItemView = [xibDataItem objectAtIndex:0];
        itemViewRect = CGRectMake(
                                  0,
                                  i * 600 + i * 20,
                                  viewRect.size.width,
                                  600);
        [dataItemView setFrame:itemViewRect];
        // 设置数据
        dataItemView.dataArray = [[NSArray alloc]initWithObjects:
                                  @"爸爸：你好啊", @"妈妈：你好", @"爷爷：空气真清新啊", @"奶奶：说点什么", nil];
        [dataItemView initView];
        [viewItemArray addObject:dataItemView];
        [viewDataScroll addSubview:dataItemView];
        
        // 设置拥抱结果双色字体
        dataItemView.labelEmbrace.attributedText =
        [sfe_file divisionFontColor:@"爸爸，妈妈：拥抱了你!" Spliter:@"：" Colors:[[NSArray alloc]initWithObjects:[UIColor redColor], [UIColor blueColor], nil]];
    }
    /// 添加数据结束
    
    // 实现可滚动
    [viewDataScroll setContentSize:CGSizeMake(viewDataScrollRect.origin.x, viewDataScrollRect.size.height * 10.15)];
    [viewDataScroll setContentOffset:CGPointMake(viewDataScrollRect.size.height * 5, 0)];
    // 拖动时遇到边框反弹页面
    viewDataScroll.bounces = TRUE;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
