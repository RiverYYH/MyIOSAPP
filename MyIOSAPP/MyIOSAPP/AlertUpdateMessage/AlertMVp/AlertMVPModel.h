//
//  AlertMVPModel.h
//  MyIOSAPP
//
//  Created by river on 2018/2/27.
//  Copyright © 2018年 river. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlertMVPModel : NSObject
@property (strong, nonatomic) NSArray<NSString *> *entryTitles;
@property (strong, nonatomic) NSArray<NSString *> *entryDetails;
@property (strong, nonatomic) NSArray<NSString *> *entryClasses;

@end
