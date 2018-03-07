//
//  ModeShowViewController.m
//  MyIOSAPP
//
//  Created by river on 2018/1/25.
//  Copyright © 2018年 river. All rights reserved.
//

#import "ModeShowViewController.h"
#import "BroadcastView.h"
#import "BroadcastPresenter.h"

@interface ModeShowViewController ()
@property (nonatomic,strong) BroadcastView * broadcastView;
@property (nonatomic,strong) BroadcastPresenter * broadcasPresenter;

@end

@implementation ModeShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设计模式";
    [self showModelView];
    
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

-(void)showModelView{
    switch (self.typeIndex) {
        case 0:
        {
//            NSLog(@"显示mvp模式");
//            MVPView * mvpView = [MVPView new];
//            mvpView.frame = self.view.frame;
//            mvpView.backgroundColor = [UIColor whiteColor];
//            self.view = mvpView;
            self.broadcastView = [BroadcastView new];
            self.broadcastView.frame = self.view.frame;
            self.title = @"MVP 模式实现";
            self.view = self.broadcastView;
            self.broadcasPresenter = [BroadcastPresenter new];
            [self.broadcastView buildBroadcastView:self withPresenter:_broadcasPresenter];
            [self.broadcasPresenter initPresenterSub:self.broadcastView];
            
        }
            break;
        case 1:{
            NSLog(@"显示mvvm模式");
        }
            break;
        default:
            break;
    }
}

@end
