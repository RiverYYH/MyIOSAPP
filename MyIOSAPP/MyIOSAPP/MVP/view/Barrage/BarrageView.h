//
//  BarrageView.h
//  BarrageTestDemo
//
//  Created by river on 2017/11/9.
//  Copyright © 2017年 river. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,BarrageViewStatus) {
    BarrageViewMoveStart,
    BarrageViewMoveEnter,
    BarrageViewMoveEnd,
};

@interface BarrageView : UIView
//弹幕的轨道
@property(nonatomic, assign) NSInteger trajectory;
//弹幕的运行状态
@property(nonatomic, copy) void (^moveStatusBlock)(BarrageViewStatus status);
//初始化弹幕
-(instancetype) initWithBarrageString:(NSString*)comment;
/** 开始动画*/
-(void)startAnimation;
/** 结束动画*/
-(void)stopAnimation;
@end
