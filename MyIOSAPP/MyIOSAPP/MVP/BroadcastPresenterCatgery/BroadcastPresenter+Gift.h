//
//  BroadcastPresenter+Gift.h
//  Broadcast
//
//  Created by river on 2017/11/23.
//  Copyright © 2017年 river. All rights reserved.
//

#import "BroadcastPresenter.h"
#import "ChannelMessage.h"

@interface BroadcastPresenter (Gift)
- (void)prepareGiftQueue;
- (void)destroyGiftQueue;

- (void)onReceiveGiftMsg:(ChannelMessage*)gift;
@end
