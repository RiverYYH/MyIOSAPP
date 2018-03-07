//
//  BtnActionView.h
//  Broadcast
//
//  Created by river on 2017/11/21.
//  Copyright © 2017年 river. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BtnActionViewDelegate<NSObject>
//聊天
-(void)showChatView:(BOOL)chatState;
//出发显示礼物显示view
-(void)showGitView:(BOOL)gitState;
@end
@class ModeShowViewController;
@interface BtnActionView : UIView
@property (nonatomic,assign) id<BtnActionViewDelegate>delegate;

-(void)initCustomView:(ModeShowViewController*)cotroller;
@end
