//
//  BroadcastView.m
//  Broadcast
//
//  Created by river on 2017/11/21.
//  Copyright © 2017年 river. All rights reserved.
//

#import "BroadcastView.h"
#import "TopHeaderView.h"
#import "BtnActionView.h"
#import "HeartView.h"
#import "GitSelectionView.h"
#import "gifView.h"
#import "BarrageBgView.h"
// 屏幕尺寸
#define SCREEN_SIZE         [UIScreen mainScreen].bounds.size
#define SCREEN_WIDTH        SCREEN_SIZE.width
#define SCREEN_HEIGHT       SCREEN_SIZE.height
#define SCREEN_SCALE        [UIDevice currentDevice].screenScale


@interface BroadcastView()<BtnActionViewDelegate>
@property (nonatomic,strong) UIImageView        * viewBgImg;
//顶部头像view
@property (nonatomic,strong) TopHeaderView      * topHeaderView;
//底部按钮view
@property (nonatomic,strong) BtnActionView      * btnActionView;
//添加heartview动画
@property (nonatomic,strong) HeartView          * heartView;
//添加礼品view
@property (nonatomic,strong) GitSelectionView   * gitSelectionview;

@property (nonatomic,strong) gifView            * gifView;

@property (nonatomic,strong) BarrageBgView      *barrageBgView;

@end
@implementation BroadcastView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)init{
    if(self = [super init]){
    }
    return self;
}

-(void)buildBroadcastView:(ModeShowViewController*)broadcastCtr withPresenter:(BroadcastPresenter*)presenter{
    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = YES;
    
    int viewHeight = self.bounds.size.height -37;
    int viewWidth = self.bounds.size.width;
    int marginX = 0;
    int marginY = 20;
    
    //添加背景图片
    self.viewBgImg = [UIImageView new];
    _viewBgImg.image = [UIImage imageNamed:@"avatarBig.png"];
    _viewBgImg.frame = self.bounds;
    _viewBgImg.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_viewBgImg];
    int avatarListHeight = 40;
    self.topHeaderView = [TopHeaderView new];
    _topHeaderView.frame = CGRectMake(marginX, marginY, SCREEN_WIDTH, avatarListHeight);
    [_topHeaderView initCustomView];
    [self addSubview:_topHeaderView];
    
    //添加弹幕View显示
    self.barrageBgView = [BarrageBgView new];
    _barrageBgView.frame =CGRectMake(marginX, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.barrageBgView initCustomView:presenter];
    [self addSubview:_barrageBgView];
    
    //添加礼物显示view
    int giftViewHeight = 120;
    self.gifView = [gifView new];
    self.gifView.frame = CGRectMake(marginX, SCREEN_HEIGHT - 400, SCREEN_WIDTH, giftViewHeight);
    [_gifView initCustomView];
    [self addSubview:self.gifView];
  
    
    //添加底部按钮view
    int actionViewHeight = 41;
    self.btnActionView = [BtnActionView new];
    self.btnActionView.frame = CGRectMake(marginX, viewHeight-actionViewHeight, SCREEN_WIDTH, actionViewHeight);
    [self.btnActionView initCustomView:broadcastCtr];
    [self addSubview:_btnActionView];
    self.btnActionView.delegate = self;
    
    //添加礼品view
    self.gitSelectionview = [GitSelectionView new];
    _gitSelectionview.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self addSubview:_gitSelectionview];
    [_gitSelectionview initCustomView:presenter];

    
}

//点击礼物按钮显示礼物界面
-(void)showGitView:(BOOL)gitState{
    [_gitSelectionview showGiftSelectionView:gitState];
}

//聊天
-(void)showChatView:(BOOL)chatState{
    NSLog(@"%d",chatState);
    if (chatState) {
    NSLog(@"start");
        [self.barrageBgView startBarrage];
    }else{
        NSLog(@"stop");
        [self.barrageBgView stopBarrage];
    }
    
}
-(void)showGiftAnmation{
    [_gifView showGeneralGiftAnimation];
}

@end
