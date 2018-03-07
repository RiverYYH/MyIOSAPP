//
//  BarrageView.m
//  BarrageTestDemo
//
//  Created by river on 2017/11/9.
//  Copyright © 2017年 river. All rights reserved.
//

#import "BarrageView.h"
#define Padding       10
#define viewHeight    30

@interface BarrageView()
@property (nonatomic,strong) UILabel * lbComment;
@end

@implementation BarrageView

//初始化弹幕
-(instancetype) initWithBarrageString:(NSString*)comment{
    if(self = [super init]){
        self.backgroundColor = [UIColor redColor];
        //计算评论内容实际宽度，设置弹幕宽度
        NSDictionary * arrt = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
        CGFloat width = [comment sizeWithAttributes:arrt].width;
        self.bounds = CGRectMake(0, 0, width + 2*Padding, viewHeight);
        self.lbComment.frame = CGRectMake(Padding, 0, width, viewHeight);
        self.lbComment.text = comment;
        
    }
    return self;
}
/** 开始动画*/
-(void)startAnimation{
    //计算整个屏幕宽度，根据v=s/t公式，设定固定时间计算出来弹幕从右移动到左边的速度
    self.moveStatusBlock(BarrageViewMoveStart);
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat barrageWidth = CGRectGetWidth(self.bounds);
    
    CGFloat duration = (barrageWidth / (screenWidth / 4))  * 3.0;
    CGFloat wholeWidth = screenWidth + CGRectGetWidth(self.bounds);
    
    CGFloat speed = wholeWidth / duration;
    CGFloat enterDelay = barrageWidth / speed;
    [self performSelector:@selector(enterScreen) withObject:nil afterDelay:enterDelay];
    
    __block CGRect frame = self.frame;
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        frame.origin.x -= wholeWidth;
        self.frame = frame;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        if(self.moveStatusBlock){
            self.moveStatusBlock(BarrageViewMoveEnd);
        }
    }];
    
    
}
/** 结束动画*/
-(void)stopAnimation{
    [self.layer removeAllAnimations];
    [self removeFromSuperview];
}

//初始化显示内容的label
-(UILabel*)lbComment{
    if(!_lbComment){
        _lbComment = [[UILabel alloc] initWithFrame:CGRectZero];
        _lbComment.font = [UIFont systemFontOfSize:14];
        _lbComment.textColor = [UIColor whiteColor];
        _lbComment.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lbComment];
    }
    
    return _lbComment;
}

-(void)enterScreen
{
    if (self.moveStatusBlock) {
        self.moveStatusBlock(BarrageViewMoveEnter);
    }
}


@end
