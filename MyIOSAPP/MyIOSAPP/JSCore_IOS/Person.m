//
//  Person.m
//  MyIOSAPP
//
//  Created by river on 2018/3/28.
//  Copyright © 2018年 river. All rights reserved.
//

#import "Person.h"

@implementation Person
//@synthesize firstName, lastName;
- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}
@end
