//
//  People.m
//  C语言第一天
//
//  Created by 孙亚锋 on 2017/8/28.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import "People.h"

@interface People()
{
    @public
    NSString *publicName;
    
   @protected
    NSString* protectedName;
    
    @private
    NSString* privateName;
}

@end


@implementation People

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"init方法");
    }
    return self;
}
+(void)load{
    NSLog(@"调用了load方法");
}
+(void)initialize{
    NSLog(@"调用了initialize方法");
}

@end
