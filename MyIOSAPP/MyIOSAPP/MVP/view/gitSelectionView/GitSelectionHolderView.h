//
//  GitSelectionHolderView.h
//  Broadcast
//
//  Created by river on 2017/11/21.
//  Copyright © 2017年 river. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol GitSelectionHolderViewDelegate <NSObject>
-(void)sendGiftWithIndex:(int)index;
@end

@interface GitSelectionHolderView : UIView
@property (nonatomic,assign) id<GitSelectionHolderViewDelegate>delegate;

- (void)buildGifts;
- (void)showWithAnimated:(BOOL)animated;
- (void)hideWithAnimated:(BOOL)animated;
@end
