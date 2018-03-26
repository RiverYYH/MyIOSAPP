//
//  CutomTableViewController.m
//  MyIOSAPP
//
//  Created by river on 2018/3/24.
//  Copyright © 2018年 river. All rights reserved.
//

#import "CutomTableViewController.h"
#import "CutomTableView.h"

@interface CutomTableViewController ()
@property (nonatomic,strong) CutomTableView * customTable;

@end

@implementation CutomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"仿真微博Cell";
    self.customTable = [[CutomTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.customTable.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.customTable.scrollIndicatorInsets = self.customTable.contentInset;
    [self.view addSubview:self.customTable];
    
    UIToolbar *statusBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    [self.view addSubview:statusBar];
    
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
