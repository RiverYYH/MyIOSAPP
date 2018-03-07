//
//  BroadcastPresenter.m
//  Broadcast
//
//  Created by river on 2017/11/22.
//  Copyright © 2017年 river. All rights reserved.
//

#import "BroadcastPresenter.h"
#import "BroadcastView.h"
#import "GiftChannelMessage.h"
#import "BarrageView.h"

@interface BroadcastPresenter()
@property (nonatomic,strong) BroadcastView * broadView;
@property (nonatomic, strong) NSTimer*                              testTimer;
@property (nonatomic, strong) NSMutableDictionary*                  giftDic;


//弹幕的数据
/** 弹幕的数据来源*/
@property(nonatomic,strong) NSMutableArray * dataSource;
/**弹幕使用过程中的数组变量*/
@property(nonatomic,strong) NSMutableArray * barrageComents;
/***存储弹幕view的数组变量*/
@property(nonatomic,strong) NSMutableArray * barrageViews;
@property (nonatomic,assign) BOOL animationIsStop;

@end
@implementation BroadcastPresenter
-(instancetype)init{
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(detectTableChannelMessageInsert:) name:Table_ChannelMessage object:nil];
        _animationIsStop = YES;

    }
    return self;
}
-(void)initPresenterSub:(BroadcastView *)broadcastView{
    self.broadView = broadcastView;
}


-(void)detectTableChannelMessageInsert:(NSNotification*)notif{
    NSDictionary* info = notif.userInfo;
    NSString* table = info[@"table"];
    NSString* event = info[@"event"];
    id data = info[@"data"];
    
    NSString* eventKey = [NSString stringWithFormat:@"%@_%@", table, event];
    ChannelMessage* msg = data;
    if (msg == nil) {
        
        return;
    }
    //play animation for gift message
    if (msg.msgtype.intValue == kChannelMsgType_Gift) {
//        [self onReceiveGiftMsg:msg];
        return;
    }
    
}

-(void)sendGiftWithIndex:(int)index{
    GiftChannelMessage* channelMsg = [GiftChannelMessage new];
    channelMsg.msgtype = @(kChannelMsgType_Gift);
    channelMsg.giftType = index;
    
    channelMsg.fromuid = @(_OwnerID);
    channelMsg.fromnickname = [NSString stringWithFormat:@"User %d", _OwnerID];
    
    int tap = 0;
    if ([_giftDic objectForKey:@(index).stringValue] == nil) {
        [_giftDic setObject:@(0) forKey:@(index).stringValue];
    }
    tap = [[_giftDic objectForKey:@(index).stringValue] intValue];
    tap ++;
    [_giftDic setObject:@(tap) forKey:@(index).stringValue];
    
    channelMsg.tapCount = tap;
    
    NSMutableDictionary *info = [NSMutableDictionary new];
    info[@"data"] = channelMsg;
    info[@"table"] = Table_ChannelMessage;
    info[@"event"] = Event_RowInsert;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SendGif" object:nil userInfo:info];
    [self.broadView showGiftAnmation];
    
}

/**
 *弹幕的业务逻辑处理
 **/

-(NSString*)nextBarrageString{
    if(!self.barrageComents.count){
        return nil;
    }
    NSString * barrageStr = self.barrageComents.firstObject;
    [self.barrageComents removeObjectAtIndex:0];
    
    return barrageStr;
}
-(void)createBarrageViewWithStr:(NSString*)barrageStr withTrajectory:(NSInteger)trajectory{
    if (_animationIsStop) {
        return;
    }
    
    BarrageView * barrageView = [[BarrageView alloc] initWithBarrageString:barrageStr];
    barrageView.trajectory = trajectory;
    [self.barrageViews addObject:barrageView];
    __weak typeof (barrageView)weakBarageView = barrageView;
    __weak typeof(self)weakSelf = self;
    barrageView.moveStatusBlock = ^(BarrageViewStatus status){
        if (weakSelf.animationIsStop) {
            return ;
        }
        switch (status) {
            case BarrageViewMoveStart:{
                // 弹幕开始进入屏幕, 判断是否还有其他内容, 如果有则在该弹幕轨迹中创建一个
                [weakSelf.barrageViews addObject:weakBarageView];
                
            }
                break;
            case BarrageViewMoveEnter:{
                // 弹幕完全进入屏幕, 判断是否还有其他内容, 如果有就在该弹幕轨迹中创建一个弹幕
                NSString *nextBarrageStr = [weakSelf nextBarrageString];
                if (nextBarrageStr) {
                    [weakSelf createBarrageViewWithStr:nextBarrageStr withTrajectory:trajectory];
                }
            }
                break;
            case BarrageViewMoveEnd:{
                // 弹幕飞出屏幕后从 bulletViews中移除, 释放资源
                if ([weakSelf.barrageViews containsObject:weakBarageView]) {
                    [weakBarageView stopAnimation];
                    [weakSelf.barrageViews removeObject:weakBarageView];
                }
                
                if (!weakSelf.barrageViews.count) {
                    // 说明屏幕上没有弹幕了, 开始循环滚动
                    weakSelf.animationIsStop = YES;
                    [weakSelf start];
                }
            }
                break;
            default:
                break;
        }
        
    };
    if(self.generateViewBlock){
        self.generateViewBlock(barrageView);
    }
}

-(void)initBarrageView{
    //设置弹幕的轨道
    NSMutableArray *trajectorys = [NSMutableArray arrayWithArray:@[@1,@2,@3]];
    NSUInteger count = trajectorys.count;
    // 给每一个轨道创建弹幕
    for (int i = 0 ; i < count; i ++) {
        if(self.barrageComents.count){
            NSInteger index = arc4random()%trajectorys.count;
            NSInteger trajectory = [[trajectorys objectAtIndex:index] intValue];
            [trajectorys removeObjectAtIndex:index];
            NSString * barrageStr = [self.barrageComents firstObject];
            [self.barrageComents removeObjectAtIndex:0];
            [self createBarrageViewWithStr:barrageStr withTrajectory:trajectory];
        }
    }
    
}

-(void)start{
    if (!_animationIsStop) {
        return;
    }
    _animationIsStop = NO;

    [self.barrageComents removeAllObjects];
    [self.barrageComents addObjectsFromArray:self.dataSource];
    [self initBarrageView];
}
-(void)stop{
    if (_animationIsStop) {
        return;
    }
    _animationIsStop = YES;
    for (BarrageView *view in self.barrageViews) {
        [view stopAnimation];
    }
    [self.barrageViews removeAllObjects];
}

-(NSMutableArray*) dataSource{
    if(!_dataSource){
        _dataSource = [NSMutableArray arrayWithArray:@[@"数据1----",@"数据2-----",@"数据3======"]];
    }
    return _dataSource;
}
-(NSMutableArray*)barrageComents{
    if(!_barrageComents){
        _barrageComents = [NSMutableArray array];
    }
    return _barrageComents;
}
-(NSMutableArray*)barrageViews{
    if(!_barrageViews){
        _barrageViews = [NSMutableArray array];
    }
    return _barrageViews;
}



@end
