//
//  BroadcastPresenter+Barrage.h
//  Broadcast
//
//  Created by river on 2017/11/27.
//  Copyright © 2017年 river. All rights reserved.
//

#import "BroadcastPresenter.h"
@class BarrageView;
@interface BroadcastPresenter (Barrage)
@property (nonatomic,copy) void (^generateViewBlock)(BarrageView* barrageView);
-(void)start;
-(void)stop;
@end
