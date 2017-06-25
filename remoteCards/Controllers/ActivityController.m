//
//  ActivityController.m
//  eCampus
//
//  Created by liujianx on 15/8/19.
//  Copyright (c) 2015年 Esquel. All rights reserved.
//

#import "ActivityController.h" 
#import "ActivityViewCell.h"
#import "Common.h"
#import "Utils.h"
#import "MBProgressHUD+MJ.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"
#import "AppDelegate.h"
#import "MobClick.h"
#import "LoginViewController.h"

@interface ActivityController (){
    UITableView *tableViewNews;
    NSMutableArray *tableData;
    AppDelegate *delegate;
}

@end

@implementation ActivityController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"PageActivityMain"];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"PageActivityMain"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    studented = [Utils loadCustomObjectWithKey:LoginKey];
    
    if(studented == nil){
      
                LoginViewController *viewCtr = [[LoginViewController alloc] init];
        
                viewCtr.title = @"用户登录";
                [self.navigationController pushViewController:viewCtr animated:YES];
        
        return;
    }
    
    tableData = [[NSMutableArray alloc] init];
    
    News *activty = [[News alloc] init];
    activty.title = @"上下班刷卡";
      activty.type = @"1";
    [tableData addObject:activty];

    activty = [[News alloc] init];
    activty.title = @"考勤明细";
    activty.type = @"2";
    [tableData addObject:activty];
    
    activty = [[News alloc] init];
    activty.title = @"考勤结果";
    activty.type = @"3";
    [tableData addObject:activty];

    activty = [[News alloc] init];
    activty.title = @"我的资料";
    activty.type = @"4";
    [tableData addObject:activty];
    activty = [[News alloc] init];
    activty.title = @"我的工资条";
    activty.type = @"5";
    [tableData addObject:activty];
    

    
    tableViewNews=[[UITableView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width,self.view.frame.size.height) style:UITableViewStyleGrouped];
    
    //设置数据源，注意必须实现对应的UITableViewDataSource协议
    tableViewNews.dataSource=self;
    //设置代理
    tableViewNews.delegate=self;
    
    tableViewNews.rowHeight = 72;
    
    
    [self.view addSubview:tableViewNews];
    
    tableViewNews.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [tableViewNews reloadData];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDelegate + UITableViewDataSource methods

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //指定cellIdentifier为自定义的cell
    static NSString *CellIdentifier = @"TableViewCell";
    //自定义cell类
    ActivityViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        //通过xib的名称加载自定义的cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ActivityViewCell" owner:self options:nil] lastObject];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    News *newModel= [tableData objectAtIndex:indexPath.row];
    
    [cell setNewsData:newModel];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 5;
    
}
#pragma mark - 数据源方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //当手指离开某行时，就让某行的选中状态消失
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    studented = [Utils loadCustomObjectWithKey:LoginKey];
    
    if(studented == nil){
        [Utils showMBAllTextDialog:@"亲,该功能必须先进行登录哦." view:self.view];
        return;
    }
    
    News *newModel= [tableData objectAtIndex:indexPath.row];

    if ([newModel.type isEqualToString:@"Activity"]){
        
        
    }else if ([newModel.type isEqualToString:@"ActivityFeeback"]){
 

    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableData.count;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}



@end
