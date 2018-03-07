//
//  gifView.m
//  Broadcast
//
//  Created by river on 2017/11/22.
//  Copyright © 2017年 river. All rights reserved.
//

#import "gifView.h"
#import "GiftBannerView.h"

// 屏幕尺寸
#define SCREEN_SIZE         [UIScreen mainScreen].bounds.size
#define SCREEN_WIDTH        SCREEN_SIZE.width
#define SCREEN_HEIGHT       SCREEN_SIZE.height
#define SCREEN_SCALE        [UIDevice currentDevice].screenScale

@implementation gifView

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

-(void)initCustomView{
//    int bannerWidth = [GiftBannerView bannerWidth];
//    int bannerHeight = [GiftBannerView bannerHeight];
//    GiftBannerView * giftBanner = [[GiftBannerView alloc] initWithFrame:CGRectMake(0, 0, bannerWidth, bannerHeight)];
//    [self addSubview:giftBanner];
//    [giftBanner initCustomView];
}

-(void)showGeneralGiftAnimation{
    int bannerWidth = [GiftBannerView bannerWidth];
    int bannerHeight = [GiftBannerView bannerHeight];

    int bottomMargin = 80 + 300;
    int originY = SCREEN_HEIGHT - bottomMargin - bannerHeight;
//    int padding = 20;
//    int line = 2;
    GiftBannerView * giftBanner = [[GiftBannerView alloc] initWithFrame:CGRectMake(0, 0, bannerWidth, bannerHeight)];
    [self addSubview:giftBanner];
    [giftBanner initCustomView];
    
    [giftBanner showWithAnimationFinishBlock:^(int line) {
        
    }];
    
    
}

@end
