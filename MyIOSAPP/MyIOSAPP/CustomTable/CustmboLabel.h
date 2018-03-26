//
//  CustmboLabel.h
//  MyIOSAPP
//
//  Created by river on 2018/3/26.
//  Copyright © 2018年 river. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustmboLabel : UIView
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic) NSInteger lineSpace;
@property (nonatomic) NSTextAlignment textAlignment;

- (void)debugDraw;
- (void)clear;
- (BOOL)touchPoint:(CGPoint)point;

@end
