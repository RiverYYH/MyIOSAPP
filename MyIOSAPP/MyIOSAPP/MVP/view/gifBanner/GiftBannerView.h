//
//  GiftBannerView.h
//  Broadcast
//
//  Created by river on 2017/11/23.
//  Copyright © 2017年 river. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^GiftBannerAnimationBlock)(int line);

@interface GiftBannerView : UIView

- (void)showWithAnimationFinishBlock:(GiftBannerAnimationBlock)block;
- (void)playNumberAnimationWithCount:(int)count;
- (void)hide;

- (void)btnAvatarClicked;

- (BOOL)isHiding;

-(void)initCustomView;
+ (CGFloat)bannerHeight;
+ (CGFloat)bannerWidth;
@end
