#import "sc_user_diary_record.h"


@interface sc_user_diary_record () <UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation sc_user_diary_record

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:DEFAULTBACKCOLOR];
    CGRect viewRect = [sfe_screen getScreenRect];
    
    // 初始化头部视图
    CGRect headViewRect = CGRectMake(0, 0, viewRect.size.width, 50);
    UIView *headView = [[UIView alloc]initWithFrame:headViewRect];
    [headView setBackgroundColor:UICOLORIMAGE(@"Resource/Images/Record/record-1.png")];
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
    
    // 初始化保存按钮
    CGRect buttonSaveRect = CGRectMake(headViewRect.size.width - 80, (headViewRect.size.height - 35) / 2, 80, 35);
    UIButton *buttonSave = [[UIButton alloc]initWithFrame:buttonSaveRect];
    [buttonSave setTitle:@"保存" forState:UIControlStateNormal];
    [buttonSave setFont:[UIFont boldSystemFontOfSize:18]];
    [buttonSave addTarget:self action:@selector(buttonSaveClick) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:buttonSave];
    
    // 记录文本框
    CGRect textDiaryRect = CGRectMake(0, headViewRect.origin.y + headViewRect.size.height, viewRect.size.width, 150);
    UITextView *textDiary = [[UITextView alloc]initWithFrame:textDiaryRect];
    [sfe_screen drawBorder:textDiary BorderColor:(CGFloat[]){0.3,0.6,0.9,0.75} BorderWidth:1 BorderRadius:3];
    [textDiary setFont:[UIFont systemFontOfSize:14]];
    [self.view addSubview:textDiary];
    
    // 照相按钮
    CGRect buttonPhotographRect = CGRectMake(viewRect.size.width / 4 - viewRect.size.width / 6 - 5, textDiaryRect.origin.y + textDiaryRect.size.height + 20, 150, 50);
    UIButton *buttonPhotograph = [[UIButton alloc]initWithFrame:buttonPhotographRect];
    [buttonPhotograph setBackgroundImage:[sfe_image imageBy:@"Resource/Images/Diary/diary-5.png"] forState:UIControlStateNormal];
    [buttonPhotograph setFont:[UIFont systemFontOfSize:26]];
    [buttonPhotograph addTarget:self action:@selector(buttonPhotographClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonPhotograph];
    
    // 相册按钮
    CGRect buttonAlbumRect = CGRectMake(buttonPhotographRect.origin.x + buttonPhotographRect.size.width + 20, textDiaryRect.origin.y + textDiaryRect.size.height + 20, 150, 50);
    UIButton *buttonAlbum = [[UIButton alloc]initWithFrame:buttonAlbumRect];
    [buttonAlbum setBackgroundImage:[sfe_image imageBy:@"Resource/Images/Diary/diary-6.png"] forState:UIControlStateNormal];
    [buttonAlbum setFont:[UIFont systemFontOfSize:26]];
    [buttonAlbum addTarget:self action:@selector(buttonAlbumClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonAlbum];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/// 保存按钮点击事件
- (void)buttonSaveClick {
    NSLog(@"\n保存\n");
}

/// 返回图片按钮点击事件
- (void)imageBackClick {
    // 返回上一个页面
    [self dismissModalViewControllerAnimated:YES];
}

/// 照相按钮点击事件
- (void)buttonPhotographClick {
    
}

/// 相册按钮点击事件
- (void)buttonAlbumClick {
    NSUInteger sourceType = -1;
    
    // 判断是否支持相机
//    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
//        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    }
//    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
//    imagePickerController.delegate = self;
//    imagePickerController.allowsEditing = YES;
//    imagePickerController.sourceType = sourceType;
//    [self presentViewController:imagePickerController animated:YES completion:^{}];
}

@end
