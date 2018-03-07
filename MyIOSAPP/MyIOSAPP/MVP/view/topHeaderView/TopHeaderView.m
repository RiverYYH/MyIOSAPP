//
//  TopHeaderView.m
//  Broadcast
//
//  Created by river on 2017/11/21.
//  Copyright © 2017年 river. All rights reserved.
//

#import "TopHeaderView.h"

@implementation TopHeaderView

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
    int marginX = 5;
    for (int i = 0; i < 20; i ++) {
        
        UIImageView* imgAvatar = [UIImageView new];
        imgAvatar.backgroundColor = [UIColor clearColor];
        imgAvatar.contentMode = UIViewContentModeScaleAspectFill;
        imgAvatar.clipsToBounds =true;
        imgAvatar.image = [UIImage imageNamed:@"avatarSmall"];
        imgAvatar.layer.cornerRadius = 18;
        imgAvatar.layer.masksToBounds = true;
        [self addSubview:imgAvatar];
        
        imgAvatar.frame = CGRectMake(marginX, 5, 36, 36);
        marginX += (5+36);
        
    }
}

@end
