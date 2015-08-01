#import "sc_user_record.h"


@interface sc_user_record () <UIScrollViewDelegate>
{
    /// 屏幕对象
    sfe_screen *screen;
    /// 滚动视图对象
    UIScrollView *scrollView;
}
@end

@implementation sc_user_record

@synthesize dataSource;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:DEFAULTBACKCOLOR];
    screen = [[sfe_screen alloc]init];
    CGRect viewRect = [sfe_screen getScreenRect];
    
    // 初始化头部视图
    CGRect headViewRect = CGRectMake(0, 0, viewRect.size.width, 50);
    UIView *headView = [[UIView alloc]initWithFrame:headViewRect];
    [headView setBackgroundColor:UICOLORIMAGE(@"Resource/Images/Record/record-1.png")];
    [self.view addSubview:headView];
    
    // 初始化头部标题
    CGRect labelTitleRect = CGRectMake(
                    (headViewRect.size.width - 120) / 2,
                    (headViewRect.size.height - 40) / 2,
                    120,
                    40);
    UILabel *labelTitle = [[UILabel alloc]initWithFrame:labelTitleRect];
    [labelTitle setText:@"宝宝数据"];
    [labelTitle setFont:[UIFont boldSystemFontOfSize:26]];
    [labelTitle setTextColor:[UIColor whiteColor]];
    [headView addSubview:labelTitle];
    
    // 中间层视图
    CGRect centerViewRect = CGRectMake(0, headViewRect.size.height, viewRect.size.width, 140);
    UIView *centerView = [[UIView alloc]initWithFrame:centerViewRect];
    [centerView setBackgroundColor:DEFAULTBACKCOLOR];
    [self.view addSubview:centerView];
    
    // 日记图片按钮
    CGRect buttonDiaryRect = CGRectMake(40, 30, 80, 80);
    UIButton *buttonDiary = [[UIButton alloc]initWithFrame:buttonDiaryRect];
    [buttonDiary setBackgroundImage:[sfe_image imageBy:@"Resource/Images/Record/record-12.png"] forState:UIControlStateNormal];
    [buttonDiary setTitle:@"日记" forState:UIControlStateNormal];
    [buttonDiary setFont:[UIFont boldSystemFontOfSize:22]];
    [buttonDiary addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [buttonDiary setTag:-1];
    [centerView addSubview:buttonDiary];
    
    // 视频图片按钮
    CGRect buttonVideoRect = CGRectMake(150, 30, 80, 80);
    UIButton *buttonVideo = [[UIButton alloc]initWithFrame:buttonVideoRect];
    [buttonVideo setBackgroundImage:[sfe_image imageBy:@"Resource/Images/Record/record-20.png"] forState:UIControlStateNormal];
    [buttonVideo setTitle:@"视频" forState:UIControlStateNormal];
    [buttonVideo setFont:[UIFont boldSystemFontOfSize:22]];
    [buttonVideo addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [buttonVideo setTag:-2];
    [centerView addSubview:buttonVideo];
    
    // 分割线图片
    CGRect imageSplitRect = CGRectMake(0, centerViewRect.origin.y + centerViewRect.size.height + 1, viewRect.size.width, 2);
    UIImageView *imageSplit = [[UIImageView alloc]initWithFrame:imageSplitRect];
    [imageSplit setImage:[sfe_image imageBy:@"Resource/Images/Record/record-4.png"]];
    [self.view addSubview:imageSplit];
    
    // 下层图片
    CGRect bottomViewRect = CGRectMake(0, imageSplitRect.origin.y + imageSplitRect.size.height + 1, viewRect.size.width, viewRect.size.height - headViewRect.size.height - centerViewRect.size.height - 54);
    UIView *bottomView = [[UIView alloc]initWithFrame:bottomViewRect];
    [bottomView setBackgroundColor:DEFAULTBACKCOLOR];
    [self.view addSubview:bottomView];
    
    // 固定功能按钮名称
    NSArray<NSString *> *fixedButtonTitleArray = [[NSArray alloc]initWithObjects:@"胸围",  @"生病", @"饮食", @"排泄", @"体重", @"身高", @"头围", nil];
    // 按钮背景图片集合
    NSArray<UIImage *> *fixedImageArray = [[NSArray alloc]initWithObjects:
            [sfe_image imageBy:@"Resource/Images/Record/record-8.png"],
            [sfe_image imageBy:@"Resource/Images/Record/record-9.png"],
            [sfe_image imageBy:@"Resource/Images/Record/record-10.png"],
            [sfe_image imageBy:@"Resource/Images/Record/record-11.png"],
            [sfe_image imageBy:@"Resource/Images/Record/record-12.png"],
            [sfe_image imageBy:@"Resource/Images/Record/record-8.png"],
            [sfe_image imageBy:@"Resource/Images/Record/record-9.png"],
            nil];
    
    ///////////// 测试数据 ////////////////
    dataSource = [[NSArray alloc]initWithObjects:@"胸围",  @"生病", @"饮食", @"排泄", @"体重", @"身高", @"头围", nil];
    /////////////////////////////////////
    
    // 按钮个数计数
    NSInteger j = 0, n = 0;
    int x = 0, y = 0;
    // 每页9个按钮分布，计算要几个页面
    NSInteger pageCount = ([fixedButtonTitleArray count] + [dataSource count]) / 9 + 1;
    // 初始化滚动视图
    CGRect scrollViewRect = CGRectMake(0, 0, bottomViewRect.size.width, bottomViewRect.size.height);
    scrollView = [[UIScrollView alloc]initWithFrame:scrollViewRect];
    [scrollView setContentSize:CGSizeMake(bottomViewRect.size.width * pageCount, 0)];
    [scrollView setDelegate:self];
    [scrollView setPagingEnabled:YES];
    [bottomView addSubview:scrollView];
    
    // 循环构建页面
    CGRect vviewRect = CGRectMake(0, 0, scrollViewRect.size.width, scrollViewRect.size.height);
    for (int i = 0; i < pageCount; i++) {
        UIView *vview;
        
        // 如果I=0，加载固定项，否则加载用户定义数据项
        int index = 0;
        if (i == 0) {
            vview = [[UIView alloc]initWithFrame:vviewRect];
            [scrollView addSubview:vview];
            for (j = 0; j < [fixedButtonTitleArray count]; j++) {
                if (n % 3 == 0 && n != 0) {
                    if (x == 3) {
                        y++;
                        x = 0;
                    }
                }
                if (index > [fixedImageArray count]) {
                    index = 0;
                }
                CGRect buttonRect = CGRectMake(40 + x * 80 + x * 30, 30 + y * 80 + y * 30, 80, 80);
                UIButton *button = [[UIButton alloc]initWithFrame:buttonRect];
                [button setTitle:[NSString stringWithFormat:@"%@", fixedButtonTitleArray[index]] forState:UIControlStateNormal];
                [button setBackgroundImage:fixedImageArray[index] forState:UIControlStateNormal];
                [button setFont:[UIFont boldSystemFontOfSize:22]];
                [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
                [button setTag:j+1];
                [vview addSubview:button];
                x++;
                index++;
                n++;
            }
        } else {///
            index = 0;
            for (j = 0; j < [dataSource count]; j++) {
                if (n % 3 == 0 && n != 0) {
                    if (x == 3) {
                        y++;
                        x = 0;
                    }
                }
                if (n % 9 == 0 && n != 0) {
                    y = 0;
                    x = 0;
                    vview = [[UIView alloc]initWithFrame:vviewRect];
                    [scrollView addSubview:vview];
                }
                if (index > [fixedImageArray count]) {
                    index = 0;
                }
                CGRect buttonRect = CGRectMake(40 + x * 80 + x * 30, 30 + y * 80 + y * 30, 80, 80);
                UIButton *button = [[UIButton alloc]initWithFrame:buttonRect];
                [button setTitle:[NSString stringWithFormat:@"%@", dataSource[index]] forState:UIControlStateNormal];
                [button setBackgroundImage:fixedImageArray[index] forState:UIControlStateNormal];
                [button setFont:[UIFont boldSystemFontOfSize:22]];
                [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
                [button setTag:j+1];
                [vview addSubview:button];
                x++;
                index++;
                n++;
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/// 图片按钮点击事件
- (void) buttonClick:(UIButton *)sender {
    NSLog(@"\n%ld\n",sender.tag);
    switch (sender.tag) {
        case -1:
            screen = [screen pageSkip:self IdentityName:@"iden_diary_record"];
            [screen show];
            break;
        case -2:
            screen = [screen pageSkip:self IdentityName:@"iden_video_record"];
            [screen show];
            break;
        case 1:
            break;
        case 2:
            break;
        case 3:
            break;
        case 4:
            break;
        case 5:
            break;
        case 6:
            break;
        case 7:
            break;
        case 8:
            break;
        default:
            break;
    }
}

@end
