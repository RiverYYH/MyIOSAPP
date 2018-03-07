//
//  BroadcastPresenter.h
//  Broadcast
//
//  Created by river on 2017/11/22.
//  Copyright © 2017年 river. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BroadcastView;
@class BarrageView;

@interface BroadcastPresenter : NSObject

/**
 * 发送弹幕功能
 */
@property (nonatomic,copy) void (^generateViewBlock)(BarrageView* barrageView);
-(void)start;
-(void)stop;


/*发送礼品功能*/
-(void)initPresenterSub:(BroadcastView*)broadcastView;
//发送礼品
-(void)sendGiftWithIndex:(int)index;
@end
