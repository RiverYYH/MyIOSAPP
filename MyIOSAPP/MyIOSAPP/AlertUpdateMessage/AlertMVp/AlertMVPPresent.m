//
//  AlertMVPPresent.m
//  MyIOSAPP
//
//  Created by river on 2018/2/27.
//  Copyright © 2018年 river. All rights reserved.
//

#import "AlertMVPPresent.h"
@interface AlertMVPPresent()
@property (nonatomic,strong) AlertMVPModel * alertModel;
@property (nonatomic,strong) AlertMVPView   * alertView;
@end
@implementation AlertMVPPresent

-(void)initWithView:(AlertMVPView *)alertView withModel:(AlertMVPModel *)model{
    self.alertView = alertView;
    self.alertModel = model;
    self.alertView.entryTitles = self.alertModel.entryTitles;
    self.alertView.entryClasses = self.alertModel.entryClasses;
    self.alertView.entryDetails = self.alertModel.entryDetails;
}
@end
