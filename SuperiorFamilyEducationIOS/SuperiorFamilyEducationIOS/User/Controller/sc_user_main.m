#import "sc_user_main.h"
#import "sc_user_home.h"
#import "sc_user_record.h"


@interface sc_user_main ()
{
    /// 首页面对象
    sc_user_home *homeView;
    /// 记录页面对象
    sc_user_record *recordView;
    
    /// 页面视图集合
    NSMutableArray *viewArray;
}
@end

@implementation sc_user_main

- (void)viewDidLoad {
    [super viewDidLoad];
    viewArray = [[NSMutableArray alloc]init];
    
    // 初始化主页视图
    homeView = [[sc_user_home alloc]init];
    // 定义主页视图的tabbar
    UITabBarItem *homeItem = [[UITabBarItem alloc]initWithTitle:@"主页" image:[sfe_image imageBy:@"Resource/Images/Home/home-9.png"] tag:1];
    [homeView setTabBarItem:homeItem];
    // 将主页视图添加到视图集合中
    [viewArray addObject:homeView];
    
    // 初始化记录页面视图
    recordView = [[sc_user_record alloc]init];
    UITabBarItem *recordItem = [[UITabBarItem alloc]initWithTitle:@"记录" image:[sfe_image imageBy:@"Resource/Images/Record/record-7.png"] tag:2];
    [recordView setTabBarItem:recordItem];
    [viewArray addObject:recordView];
    
    
    // 将视图集合添加到视图控制器
    [self setViewControllers:viewArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
