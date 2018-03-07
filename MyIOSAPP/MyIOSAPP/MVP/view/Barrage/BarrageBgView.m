//
//  BarrageBgView.m
//  Broadcast
//
//  Created by river on 2017/11/27.
//  Copyright © 2017年 river. All rights reserved.
//

#import "BarrageBgView.h"
#import "BarrageView.h"

@interface BarrageBgView()
@property (nonatomic,strong) BroadcastPresenter * presenter;
@end
@implementation BarrageBgView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
-(void)initCustomView:(BroadcastPresenter*)broadcastPresent{
    self.presenter = broadcastPresent;
    __weak typeof (self) weakSelf = self;
    [self.presenter setGenerateViewBlock:^(BarrageView *barrageView) {
        [weakSelf addBarrageView:barrageView];
    }];
}

-(void)addBarrageView:(BarrageView*)barrageView{
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    barrageView.frame = CGRectMake(screenW, 300 + barrageView.trajectory * 50, barrageView.frame.size.width, barrageView.frame.size.height);
    [self addSubview:barrageView];
    
    [barrageView startAnimation];
}

-(void)startBarrage{
    [self.presenter start];

}
-(void)stopBarrage{
    [self.presenter stop];

}


@end
