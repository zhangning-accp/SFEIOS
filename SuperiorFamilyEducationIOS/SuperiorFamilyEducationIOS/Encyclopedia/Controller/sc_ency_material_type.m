//
//  sc_encyclopedia.m
//  SuperiorFamilyEducationIOS
//
//  Created by zn-mac on 15/7/20.
//  Copyright © 2015年 zpf. All rights reserved.
//

#import "Foundation/Foundation.h"
#import "sfe_image.h"
#import "sfe_screen.h"
#import "sc_ency_material_type.h"
@interface sc_ency_material_type()<UITableViewDataSource, UITableViewDelegate> {
    sfe_screen *screen;
    NSArray *types;
    //[NSArray arryWithObjects:@"孕期",@"孕中",@"0~1",@"1~3",@"3~6",nil];
}
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation sc_ency_material_type

- (void)viewDidLoad {
    self.table.dataSource = self;
    self.table.delegate = self;
    //UIImageView *imageView = [[UIImageView alloc]init];
   
    UIImage *image = [sfe_image imageBy:@"geli-1"];
    UIImageView* imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0,0,image.size.width,
                                                                         image.size.height)];
    imageView.image = image;
    self.table.tableHeaderView = imageView;
    [super viewDidLoad];
    types = [[NSArray alloc]initWithObjects:@"孕期",@"孕中",@"0~1",@"1~3",@"3~6",nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    }
/**
 ------------------ 重写 UITableViewDataSource 方法-----------------------
 */
-(nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    cell.textLabel.text = types[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [types count];
    
}

/**
 ----------------- 重写 UITableViewDelegate 方法 ------------------------
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"selected value---->%@",types[indexPath.row]);
    
    //UINavigationController *nav = self.navigationController;
    //nav.navigationBar. = [UIColor redColor];
    //nav.navigationBar.tintColor = [UIColor colorWithRed:255.0 green:98.0 blue:123.0 alpha:1.0];
    [sfe_screen pushViewController:@"encyclopedia" IdentityName:@"iden_material" NavController:self.navigationController];
    
    //    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"encyclopedia" bundle:nil];
//    UIViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"iden_material"];
//    
//    [self.navigationController pushViewController:viewController animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
