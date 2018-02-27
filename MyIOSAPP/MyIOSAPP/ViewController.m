//
//  ViewController.m
//  MyIOSAPP
//
//  Created by river on 2017/12/28.
//  Copyright © 2017年 river. All rights reserved.
//

#import "ViewController.h"
#import "ModelDesignViewController.h"
#import "UpLoadImageViewController.h"
#import "QueueViewController.h"
#import "AlertUpdateMessageViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong) NSMutableArray * dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"我的APP";
    self.dataArray = [NSMutableArray arrayWithObjects:@"设计模式",@"多张图片上传",@"多线程NSOperationQueue",@"App有版本更新时候打开出现的提示", nil];
    self.myTableView.tableFooterView = [[UIView alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- UITableViewDelegate and UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60.0f;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId = @"cellId";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    UILabel * titleLb = [[UILabel alloc] initWithFrame:CGRectMake(20, 2, cell.contentView.frame.size.width, 58)];
    titleLb.text = [NSString stringWithFormat:@"%@",self.dataArray[indexPath.row]];
    [cell.contentView addSubview:titleLb];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    switch (indexPath.row) {
        case 0:
        {
            ModelDesignViewController * modelDesign = [ModelDesignViewController new];
            [self.navigationController pushViewController:modelDesign animated:YES];
            
        }
            break;
        case 1:{
            UpLoadImageViewController * upLoadImage = [UpLoadImageViewController new];
            [self.navigationController pushViewController:upLoadImage animated:YES];
        }
            break;
        case 2:{
            QueueViewController * queueView = [QueueViewController new];
            [self.navigationController pushViewController:queueView animated:YES];
            
        }break;
        case 3:{
            AlertUpdateMessageViewController * alerMessage = [AlertUpdateMessageViewController new];
            [self.navigationController pushViewController:alerMessage animated:YES];
        }break;
        default:
            break;
    }
    
}

@end
