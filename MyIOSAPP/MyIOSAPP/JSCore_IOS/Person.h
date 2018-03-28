//
//  Person.h
//  MyIOSAPP
//
//  Created by river on 2018/3/28.
//  Copyright © 2018年 river. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol PersonProtocol <JSExport>
- (NSString *)fullName;
@end

@interface Person : NSObject <PersonProtocol>
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;

@end
