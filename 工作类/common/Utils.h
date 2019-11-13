//
//  Utils.h
//  work
//
//  Created by space 5 on 15/11/4.
//  Copyright (c) 2015年 space 5. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject
+(BOOL) isMobilePhone:(NSString *)phoneNumber;
+(BOOL) isEmpty:(NSString *)str;
+(BOOL) isNotEmpty:(NSString *)str;
+(double)obtainImgHeight:(double)width;
+(bool) isFastDoubleClick1:(long)opIntervalTime;
+(bool) isFastDoubleClick2:(long)opIntervalTime;
+(bool) isFastDoubleClick3:(long)opIntervalTime;
+(bool) isFastDoubleClick4:(long)opIntervalTime;
+(bool) isFastDoubleClick5:(long)opIntervalTime;
+(BOOL) validateEmail:(NSString *)email;

@end
