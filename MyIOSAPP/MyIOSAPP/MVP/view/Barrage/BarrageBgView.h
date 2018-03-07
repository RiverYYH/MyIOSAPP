//
//  BarrageBgView.h
//  Broadcast
//
//  Created by river on 2017/11/27.
//  Copyright © 2017年 river. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BroadcastPresenter.h"
@interface BarrageBgView : UIView
-(void)initCustomView:(BroadcastPresenter*)broadcastPresent;
-(void)startBarrage;
-(void)stopBarrage;
@end
