//
//  Utils.m
//  work
//
//  Created by space 5 on 15/11/4.
//  Copyright (c) 2015年 space 5. All rights reserved.
//

#import "Utils.h"
static long LAST_CLICK_TIME1 = 0;
static long LAST_CLICK_TIME2 = 0;
static long LAST_CLICK_TIME3 = 0;
static long LAST_CLICK_TIME4 = 0;
static long LAST_CLICK_TIME5 = 0;
@implementation Utils
+(BOOL) isMobilePhone:(NSString *)phoneNumber{
    NSString *regex = @"^((13[0-9])|(15[0-9])|(14[1,4,5,7])|(17[0,6-8])|(18[0-9]))\\d{8}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:phoneNumber];
    return isMatch;
}
+(BOOL)isEmpty:(NSString *)str{
    if ([str isKindOfClass:[NSNull class]]) {
        return true;
    }
    if([str isEqual:@""] || str.length <= 0){
        return true;
    }
    return false;
}
+(BOOL)isNotEmpty:(NSString *)str{
    return ![self isEmpty:str];
}
+(double)obtainImgHeight:(double)width{
    int w = 980;
    int h = 680;
    return (width * h) / w;
}
/**
 * 根据传过来的时间间隔进行是否快速点击判断；
 * opIntervalTime ： 时间间隔，单位毫秒；
 **/
+(bool)isFastDoubleClick1:(long)opIntervalTime{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    long time = [date timeIntervalSince1970] * 1000;
    long intervalTime = time - LAST_CLICK_TIME1;
    if(0 < intervalTime && intervalTime < opIntervalTime){
        return true;
    }
    LAST_CLICK_TIME1 = time;
    return false;
}
+(bool)isFastDoubleClick2:(long)opIntervalTime{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    long time = [date timeIntervalSince1970] * 1000;
    long intervalTime = time - LAST_CLICK_TIME2;
    if(0 < intervalTime && intervalTime < opIntervalTime){
        return true;
    }
    LAST_CLICK_TIME2 = time;
    return false;
}
+(bool)isFastDoubleClick3:(long)opIntervalTime{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    long time = [date timeIntervalSince1970] * 1000;
    long intervalTime = time - LAST_CLICK_TIME3;
    if(0 < intervalTime && intervalTime < opIntervalTime){
        return true;
    }
    LAST_CLICK_TIME3 = time;
    return false;
}
+(bool)isFastDoubleClick4:(long)opIntervalTime{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    long time = [date timeIntervalSince1970] * 1000;
    long intervalTime = time - LAST_CLICK_TIME4;
    if(0 < intervalTime && intervalTime < opIntervalTime){
        return true;
    }
    LAST_CLICK_TIME4 = time;
    return false;
}
+(bool)isFastDoubleClick5:(long)opIntervalTime{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    long time = [date timeIntervalSince1970] * 1000;
    long intervalTime = time - LAST_CLICK_TIME5;
    if(0 < intervalTime && intervalTime < opIntervalTime){
        return true;
    }
    LAST_CLICK_TIME5 = time;
    return false;
}


+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

@end
