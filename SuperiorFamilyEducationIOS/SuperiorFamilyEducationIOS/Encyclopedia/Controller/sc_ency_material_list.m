//
//  sc_material_list.m
//  SuperiorFamilyEducationIOS
//
//  Created by zn-mac on 15/7/22.
//  Copyright © 2015年 zpf. All rights reserved.
//

#import "sc_ency_material_list.h"
#import "sm_encyclopedia_material_entity.h"
@interface sc_ency_material_list (){
    NSMutableArray *materialList;
}
@end

@implementation sc_ency_material_list

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"material_cell"];
    materialList = [[NSMutableArray alloc]init];
    for(int i = 0; i < 3; i ++) {
        sm_encyclopedia_material_entity *material = [[sm_encyclopedia_material_entity alloc]init];
        material.id = i;
        material.title = [NSString stringWithFormat:@"宝宝资料－－－%d",i];
        material.shortContent = [NSString stringWithFormat:@"material_shortContent_%d",i];
        material.fullContent = [NSString stringWithFormat:@"material_fullContent_%d",i];
        material.praise = i + 1;
        material.collect = i + 2;
        material.review = i + 3;
        [materialList addObject:material];
    }
    
    
    NSArray *familyNames =[[NSArray alloc]initWithArray:[UIFont familyNames]];
    NSArray *fontNames;
    NSInteger indFamily, indFont;
    NSLog(@"[familyNames count]===%lu",(unsigned long)[familyNames count]);
    for(indFamily=0;indFamily<[familyNames count];++indFamily)
        
    {
        NSLog(@"Family name: %@", [familyNames objectAtIndex:indFamily]);
        fontNames =[[NSArray alloc]initWithArray:[UIFont fontNamesForFamilyName:[familyNames objectAtIndex:indFamily]]];
        
        for(indFont=0; indFont<[fontNames count]; ++indFont)
            
        {
            NSLog(@"Font name: %@",[fontNames objectAtIndex:indFont]);
            
        }
        
        //[fontNames release];
    }
    UIActivityIndicatorView __block *progress = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
   
    self.tableView.tableHeaderView = progress;
    [progress startAnimating];
    
    double delayInSeconds = 3.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [progress stopAnimating];
        progress = nil;
        self.tableView.tableHeaderView = nil;

    });

    
    //[familyNames release];
    //self.tableView.dataSource = self;
    //self.tableView.delegate = self;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [materialList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"material_cell" forIndexPath:indexPath];
    static NSString *reuseIdentifier = @"material_cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    sm_encyclopedia_material_entity *model = materialList[indexPath.row];
    UILabel *labTitle = (UILabel *)[cell.contentView  viewWithTag:100];
    //UIFont *font = [UIFont fontWithName:@"兰亭黑 GBK" size:26];
    //labTitle.font = font;
    labTitle.text = model.title;
    
    UILabel *labShortContent = (UILabel *)[cell.contentView viewWithTag:2];
    //labShortContent.font = [UIFont fontWithName:@"兰亭黑 GBK" size:17];
    labShortContent.text = model.shortContent;
    
    UILabel *labPraise = (UILabel *)[cell viewWithTag:3];
    //labShortContent.font = [UIFont fontWithName:@"兰亭黑 GBK" size:17];
    labPraise.text = [NSString stringWithFormat:@"%ld",(long)model.praise];
    
    UILabel *labReview = (UILabel *)[cell viewWithTag:4];
    //labShortContent.font = [UIFont fontWithName:@"兰亭黑 GBK" size:17];
    labReview.text = [NSString stringWithFormat:@"%ld",(long)model.review];
    
    UILabel *labCollect = (UILabel *)[cell viewWithTag:5];
    //labCollect.font = [UIFont fontWithName:@"兰亭黑 GBK" size:17];
    labCollect.text = [NSString stringWithFormat:@"%ld",(long)model.collect];
    
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //self.labTitle.text = model.title;
//    self.labShortContent.text = model.shortContent;
//    self.labPraise.text = [NSString stringWithFormat:@"%ld",(long)model.praise];
//    self.labCollect.text = [NSString stringWithFormat:@"%ld",(long)model.collect];
//    self.labReview.text = [NSString stringWithFormat:@"%ld",(long)model.review];
    
    //NSArray *subViews = [cell subviews];
    //[self showAllSubView:cell.contentView];
    return cell;
}
- (void)showAllSubView:(UIView *)view
{
    for (UIView * subView in [view subviews]) {
        NSLog(@"%@, tag:%ld",subView,(long)subView.tag) ;
        [self showAllSubView:subView] ;
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
