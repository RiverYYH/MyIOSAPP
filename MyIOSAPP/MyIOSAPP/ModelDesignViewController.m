//
//  ModelDesignViewController.m
//  MyIOSAPP
//
//  Created by river on 2017/12/28.
//  Copyright © 2017年 river. All rights reserved.
//

#import "ModelDesignViewController.h"
#import "ModeShowViewController.h"

@interface ModelDesignViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) UITableView * designTableView;
@property(nonatomic,strong) NSMutableArray * dataArray;
@end

@implementation ModelDesignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArray = [NSMutableArray arrayWithObjects:@"MVP",@"MVVM" ,nil];
    self.title = @"设计模式";
    self.designTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.view.backgroundColor = [UIColor whiteColor];
    self.designTableView.tableFooterView = [[UIView alloc] init];
    self.designTableView.delegate = self;
    self.designTableView.dataSource = self;
    [self.view addSubview:self.designTableView];
    
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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50.0f;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId = @"DesignCellId";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    for ( UIView * tempView in cell.contentView.subviews) {
        [tempView removeFromSuperview];
    }
    UILabel * titleLb = [[UILabel alloc] initWithFrame:CGRectMake(20, 2, cell.contentView.frame.size.width, 38)];
    titleLb.text = [NSString stringWithFormat:@"%@",self.dataArray[indexPath.row]];
    [cell.contentView addSubview:titleLb];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//    NSInteger row = indexPath.row;
    ModeShowViewController * modelView = [ModeShowViewController new];
    
    modelView.typeIndex = indexPath.row;
    [self.navigationController pushViewController:modelView animated:YES];
    
}


@end
