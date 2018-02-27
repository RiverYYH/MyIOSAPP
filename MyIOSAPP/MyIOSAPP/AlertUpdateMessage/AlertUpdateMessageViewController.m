//
//  AlertUpdateMessageViewController.m
//  MyIOSAPP
//
//  Created by river on 2018/2/27.
//  Copyright © 2018年 river. All rights reserved.
//

#import "AlertUpdateMessageViewController.h"
#import "SELUpdateAlert.h"
#import "AlertMVPView.h"
#import "AlertMVPPresent.h"
#import "AlertMVPModel.h"

@interface AlertUpdateMessageViewController ()
@property (strong, nonatomic) NSArray<NSString *> *entryTitles;
@property (strong, nonatomic) NSArray<NSString *> *entryDetails;
@property (strong, nonatomic) NSArray<NSString *> *entryClasses;
@end

@implementation AlertUpdateMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    /** 添加更新提示 */
    //方法一：
    [SELUpdateAlert showUpdateAlertWithVersion:@"1.0.0" Descriptions:@[@"1.xxxxxxxxxx",@"2.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",@"3.xxxxxxxxxx",@"4.xxxxxxxxxx"]];
    
    //方法二：
    //[SELUpdateAlert showUpdateAlertWithVersion:@"1.0.0" Description:@"1.xxxxxxxxxx\n2.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\n3.xxxxxxxxx\n4.xxxxxxxxxx"];
    
    AlertMVPView * alertView = [AlertMVPView new];
    alertView.frame = self.view.bounds;
    [self.view addSubview:alertView];
    AlertMVPModel * model = [AlertMVPModel new];
    AlertMVPPresent * present = [AlertMVPPresent new];
    model.entryTitles = self.entryTitles;
    model.entryClasses = self.entryClasses;
    model.entryDetails = self.entryDetails;
    [present initWithView:alertView withModel:model];
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

-(NSArray<NSString*>*)entryTitles{
    if (!_entryTitles) {
        _entryTitles = @[@"普通弹出框",
                         @"文本弹出框",
                         @"输入弹出框",
                         @"带多个按钮的弹出框",
                         @"带多个输入框的弹出框",
                         @"带阴影的普通弹出框",
                         @"带阴影的文本弹出框",
                         @"带阴影的输入弹出框",
                         @"带阴影的多个按钮弹出框",
                         @"中间显示动画的普通弹框",
                         @"左侧进入的普通文本弹框",
                         @"底部进入的有阴影的输入框",
                         @"alertView"];
    }
    return _entryTitles;
}

- (NSArray<NSString *> *)entryDetails {
    if (!_entryDetails) {
        _entryDetails = @[@"普通的弹出框,带有取消和确认的回调",
                          @"文本弹出框,带有取消和确认回调",
                          @"输入弹出框,带有取消和确认回调",
                          @"多按钮弹出框,带有个个按钮的回调",
                          @"多输入框的弹出框,带确认和取消",
                          @"带阴影的普通的弹出框,带有取消和确认的回调",
                          @"带阴影的文本弹出框,带有取消和确认回调",
                          @"带阴影的输入弹出框,带有取消和确认回调",
                          @"带阴影的多个按钮弹出框,带点击按钮tag的回调",
                          @"中间显示动画的普通弹框",
                          @"左侧进入的普通文本弹框",
                          @"底部进入的有阴影的输入框",
                          @"系统的弹出框"];
    }
    return _entryDetails;
}

- (NSArray<NSString *> *)entryClasses {
    if(!_entryClasses) {
        _entryClasses = @[@"MKShowDynamicStyleDefault",
                          @"MKShowDynamicStyleText",
                          @"MKShowDynamicStyleImportView",
                          @"MKShowDynamicStyleMultipleButton",
                          @"MKShowDynamicStyleMultipleImportView",
                          @"MKShowDynamicStyleShadowDefault",
                          @"MKShowDynamicStyleShadowText",
                          @"MKShowDynamicStyleShadowImportView",
                          @"MKShowDynamicStyleShadowMultipleButton",
                          @"MKShowDynamicStyleCenter",
                          @"MKShowDynamicStyleLeftIn",
                          @"MKShowDynamicStyleBottomUp",
                          @"SystemAlertView"];
    }
    return _entryClasses;
}


@end
