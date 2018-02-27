//
//  AlertMVPPresent.h
//  MyIOSAPP
//
//  Created by river on 2018/2/27.
//  Copyright © 2018年 river. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlertMVPModel.h"
#import "AlertMVPView.h"
@interface AlertMVPPresent : NSObject

-(void)initWithView:(AlertMVPView*)alertView withModel:(AlertMVPModel*)model;
@end
