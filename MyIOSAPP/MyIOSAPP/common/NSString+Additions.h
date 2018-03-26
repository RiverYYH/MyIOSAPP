//
//  NSString+Additions.h
//  MyIOSAPP
//
//  Created by river on 2018/3/24.
//  Copyright © 2018年 river. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
#import <UIKit/UIKit.h>

@interface NSString (Additions)
- (NSUInteger) compareTo: (NSString*) comp;
- (NSUInteger) compareToIgnoreCase: (NSString*) comp;
- (BOOL) contains: (NSString*) substring;
- (BOOL) endsWith: (NSString*) substring;
- (BOOL) startsWith: (NSString*) substring;
- (NSUInteger) indexOf: (NSString*) substring;
- (NSUInteger) indexOf:(NSString *)substring startingFrom: (NSUInteger) index;
- (NSUInteger) lastIndexOf: (NSString*) substring;
- (NSUInteger) lastIndexOf:(NSString *)substring startingFrom: (NSUInteger) index;
- (NSString*) substringFromIndex:(NSUInteger)from toIndex: (NSUInteger) to;
- (NSString*) trim;
- (NSArray*) split: (NSString*) token;
- (NSString*) replace: (NSString*) target withString: (NSString*) replacement;
- (NSArray*) split: (NSString*) token limit: (NSUInteger) maxResults;

- (CGSize)sizeWithConstrainedToWidth:(float)width fromFont:(UIFont *)font1 lineSpace:(float)lineSpace;
- (CGSize)sizeWithConstrainedToSize:(CGSize)size fromFont:(UIFont *)font1 lineSpace:(float)lineSpace;
- (void)drawInContext:(CGContextRef)context withPosition:(CGPoint)p andFont:(UIFont *)font andTextColor:(UIColor *)color andHeight:(float)height andWidth:(float)width;
- (void)drawInContext:(CGContextRef)context withPosition:(CGPoint)p andFont:(UIFont *)font andTextColor:(UIColor *)color andHeight:(float)height;

@end
