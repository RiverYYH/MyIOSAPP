//
//  GitSelectionView.h
//  Broadcast
//
//  Created by river on 2017/11/21.
//  Copyright © 2017年 river. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BroadcastPresenter.h"

@interface GitSelectionView : UIButton

-(void)initCustomView:(BroadcastPresenter*)presenter;
- (void)showGiftSelectionView:(BOOL)show;

@end
