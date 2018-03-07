//
//  GitSelectionView.m
//  Broadcast
//
//  Created by river on 2017/11/21.
//  Copyright © 2017年 river. All rights reserved.
//

#import "GitSelectionView.h"
#import "GitSelectionHolderView.h"
#import "BroadcastPresenter.h"

@interface GitSelectionView()<GitSelectionHolderViewDelegate>
@property(nonatomic,strong) GitSelectionHolderView  * gitHolderView;
@property (nonatomic,strong) BroadcastPresenter     * broadcastPresenter;
@end

@implementation GitSelectionView

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
        self.userInteractionEnabled = false;
    }
    return self;
}

-(void)initCustomView:(BroadcastPresenter*)presenter{
    self.backgroundColor = [UIColor clearColor];
    self.broadcastPresenter = presenter;
    CGFloat height = 240.0f;
    self.gitHolderView = [GitSelectionHolderView new];
    _gitHolderView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - height, self.bounds.size.width, height);
    [self addSubview:_gitHolderView];
    _gitHolderView.hidden = YES;

    [_gitHolderView buildGifts];
    _gitHolderView.delegate = self;
    [self addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];

}

- (void)showGiftSelectionView:(BOOL)show {
    if (show) {
        [_gitHolderView showWithAnimated:true];
    }
    else
    {
        [_gitHolderView hideWithAnimated:true];
    }
    
    self.userInteractionEnabled = show;
}

-(void)sendGiftWithIndex:(int)index{
    [self.broadcastPresenter sendGiftWithIndex:index];
}


- (void)hide
{
    [self showGiftSelectionView:false];
}

@end
