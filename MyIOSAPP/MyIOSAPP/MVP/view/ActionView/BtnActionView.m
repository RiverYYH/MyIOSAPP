//
//  BtnActionView.m
//  Broadcast
//
//  Created by river on 2017/11/21.
//  Copyright © 2017年 river. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "BtnActionView.h"
#import "ModeShowViewController.h"
#import "Masonry.h"
#import "View+MASShorthandAdditions.h"
@interface BtnActionView()
@property(nonatomic,strong) ModeShowViewController * broadcastCntrl;
@property (nonatomic, strong) UIButton *btnChat;
@property (nonatomic, strong) UIButton *btnShare;
@property (nonatomic, strong) UIButton *btnGift;
@property (nonatomic, strong) UIButton *btnClose;

@end
@implementation BtnActionView

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

-(void)initCustomView:(ModeShowViewController*)cotroller{
    self.broadcastCntrl = cotroller;
    int expandTouchArea = 4;
    self.btnChat = [UIButton new];
    _btnChat.backgroundColor = [UIColor clearColor];
    [_btnChat addTarget:self action:@selector(btnChatClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIImage *btnImage = [UIImage imageNamed:@"ic_chat"];
    [_btnChat setImage:btnImage forState:UIControlStateNormal];
    [_btnChat setImage:[UIImage imageNamed:@"ic_chat_press"] forState:UIControlStateHighlighted];
    [self addSubview:_btnChat];
    int padding = 6;
    int height = self.bounds.size.height;
    CGFloat chatButtonWith = self.bounds.size.width - ((37+expandTouchArea)*3+4*6);
    CGFloat chatIconSize = btnImage.size.height;
    //    self.btnChat.frame = CGRectMake(10, 0, btnImage.size.width, btnImage.size.height);
    [self.btnChat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(btnImage.size.width, btnImage.size.height));
    }];
    //添加关闭按钮
    int rightPadding = 6;
    self.btnClose = [UIButton new];
    [_btnClose addTarget:self action:@selector(btnCloseClicked:) forControlEvents:UIControlEventTouchUpInside];
    _btnClose.backgroundColor = [UIColor clearColor];
    btnImage = [UIImage imageNamed:@"ic_close"];
    [_btnClose setImage:btnImage forState:UIControlStateNormal];
    [_btnClose setImage:[UIImage imageNamed:@"ic_close_press"] forState:UIControlStateHighlighted];
    [self addSubview:_btnClose];
    [_btnClose setImageEdgeInsets:UIEdgeInsetsMake(expandTouchArea/2, expandTouchArea/2, expandTouchArea/2, expandTouchArea/2)];
    [_btnClose mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self).offset(-rightPadding);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(btnImage.size.width + expandTouchArea, height));
    }];
    //送礼物按钮
    self.btnGift = [UIButton new];
    rightPadding = 10;
    _btnGift.backgroundColor = [UIColor clearColor];
    
    btnImage = [UIImage imageNamed:@"ic_gift"];
    [_btnGift setImage:[UIImage imageNamed:@"ic_gift_press"] forState:UIControlStateHighlighted];
    [_btnGift addTarget:self action:@selector(btnGiftClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_btnGift setImage:btnImage forState:UIControlStateNormal];
    [self addSubview:_btnGift];
    [_btnGift setImageEdgeInsets:UIEdgeInsetsMake(expandTouchArea/2, expandTouchArea/2, expandTouchArea/2, expandTouchArea/2)];
    [_btnGift mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(_btnClose.mas_leading).offset(-rightPadding+expandTouchArea);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(btnImage.size.width + expandTouchArea, height));
    }];
    //添加分享按钮
    self.btnShare = [UIButton new];
    [_btnShare addTarget:self action:@selector(btnShareClicked:) forControlEvents:UIControlEventTouchUpInside];
    _btnShare.backgroundColor = [UIColor clearColor];
    btnImage = [UIImage imageNamed:@"ic_share"];
    [_btnShare setImage:btnImage forState:UIControlStateNormal];
    [_btnShare setImage:[UIImage imageNamed:@"ic_share_press"] forState:UIControlStateHighlighted];
    [self addSubview:_btnShare];
    [_btnShare setImageEdgeInsets:UIEdgeInsetsMake(expandTouchArea/2, expandTouchArea/2, expandTouchArea/2, expandTouchArea/2)];
    [_btnShare mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(_btnGift.mas_leading).offset(-rightPadding+expandTouchArea);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(btnImage.size.width + expandTouchArea, height));
    }];
}

//聊天按钮点击事件
-(void)btnChatClicked:(id)sender{
    UIButton * button = sender;
    NSInteger btnTag = button.tag;
    button.tag = !btnTag;
    if (self.delegate && [self.delegate respondsToSelector:@selector(showChatView:)]) {
        if (!btnTag) {
            [self.delegate showChatView:true];
            
        }else{
            [self.delegate showChatView:false];
            
        }
    }
    
}

//关闭返回按钮
-(void)btnCloseClicked:(id)sender{
    [self.broadcastCntrl dismissViewControllerAnimated:YES completion:^{
        
    }];
}

//礼物按钮点击事件
-(void)btnGiftClicked:(id)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(showGitView:)]) {
        [self.delegate showGitView:true];
    }
}

//分享按钮点击事件
-(void)btnShareClicked:(id)sender{
    
}
@end

