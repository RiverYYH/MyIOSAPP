//
//  BroadcastView.h
//  Broadcast
//
//  Created by river on 2017/11/21.
//  Copyright © 2017年 river. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModeShowViewController.h"
#import "BroadcastPresenter.h"

@interface BroadcastView : UIView
-(void)buildBroadcastView:(ModeShowViewController*)broadcastCtr withPresenter:(BroadcastPresenter*)presenter;

-(void)showGiftAnmation;
@end
