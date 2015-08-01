//
//  sc_test.m
//  SuperiorFamilyEducationIOS
//
//  Created by zn-mac on 15/7/20.
//  Copyright © 2015年 zpf. All rights reserved.
//

#import "sc_test.h"

@interface sc_test () {
    sfe_screen *screen;
}

@end

@implementation sc_test

- (IBAction)click:(id)sender {
    
    screen = [[sfe_screen alloc]init];
    
    [screen pageSkip:self IdentityName:@"iden_nav_ency"];
    [screen show];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
