//
//  ThetimeToNow.m
//  work
//
//  Created by space 5 on 15/10/29.
//  Copyright (c) 2015年 space 5. All rights reserved.
//

#import "ThetimeToNow.h"

@implementation ThetimeToNow

//计算某个时间距离现在时间的差值
+(NSString *)intervalSinceNow: (NSString *) theDate
{
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];//格式化
    
    [df setDateFormat:@"yyyyMMddHHmmss"];
    
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"] ];
    NSDate *date =[[NSDate alloc]init];
    
    date =[df dateFromString:theDate];
    
    //NSString * str = [NSString stringWithFormat:@"%@",date];
    
    NSTimeInterval late=[date timeIntervalSince1970]*1;
    
    
    NSDate* dat = [NSDate date];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    NSString *timeString=@"";
    
    NSTimeInterval cha=late-now;
    if (cha <0) {
        cha =now -late;
    }
    
    if (cha/3600<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/60];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@分钟", timeString];
        
    }
    if (cha/3600>1&&cha/86400<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/3600];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@小时", timeString];
    }
    if (cha/86400>1)
    {
        timeString = [NSString stringWithFormat:@"%f", cha/86400];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@天", timeString];
        
    }
    //[date release];
    return timeString;
}

@end
