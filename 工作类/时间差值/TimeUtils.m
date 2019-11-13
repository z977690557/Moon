//
//  TimeUtils.m
//  work
//
//  Created by space 5 on 15/11/5.
//  Copyright (c) 2015年 space 5. All rights reserved.
//

#import "TimeUtils.h"

@implementation TimeUtils
//计算某个时间距离现在时间的差值
+(NSString *)intervalSinceNow: (NSString *) theDate
{
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];//格式化
    
    [df setDateFormat:@"yyyyMMddHHmmss"];
    
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"] ];
    NSDate *date =[[NSDate alloc]init];
    
    date =[df dateFromString:theDate];
    
    NSTimeInterval late=[date timeIntervalSince1970]*1;
    
    NSString *currentTime = [df stringFromDate:[NSDate date]];
    
    NSDate * da =[df dateFromString:currentTime];
    
    NSTimeInterval now=[da timeIntervalSince1970]*1;
    NSString *timeString=@"";
    
    long interval=late-now;
    if (interval <0) {
        return @"0";
    }
    interval = interval / 60;
    if(interval < 60) {
        timeString = [NSString stringWithFormat:@"%ld分钟", interval];
    } else if(interval >= 60 && interval < 24 * 60){
        NSInteger hour = interval / 60;
        timeString = [NSString stringWithFormat:@"%ld小时", hour];

    } else if(interval > 24 * 60 && interval < 365 * 24 * 60){
        long day = interval / (24 * 60);
        long hours = interval % (24 * 60);
        
        if(hours > 0){
            long h = hours / 60;
            timeString = [NSString stringWithFormat:@"%ld天%ld小时",day,h];
        } else {
            timeString = [NSString stringWithFormat:@"%ld天", day];
        }
    }else if(interval >= 365 * 24 * 60){
        long days = interval % (365 * 24 * 60);
        if(days > 0) {
            long d = days / (24 * 60);
            timeString = [NSString stringWithFormat:@"%ld年%ld天",days,d];
        } else {
            timeString = [NSString stringWithFormat:@"%ld天", days];
        }
    }
    
    return timeString;
}

+(NSString *)thePublicTime:(NSString *)publicTime;
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init] ;
    [fmt setDateStyle:NSDateFormatterMediumStyle];
//    [fmt setTimeStyle:NSDateFormatterShortStyle];
  
    [fmt setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"] ];
      fmt.dateFormat = @"YYYY-MM-dd HH:mm";
    NSDate *date =[[NSDate alloc]init];
    
    date =[fmt dateFromString:publicTime];
    NSTimeInterval late=[date timeIntervalSince1970]*1;

//    NSDate *beginDate = [fmt dateFromString:cellSecondDemo.taskBeginTiemM];
//    NSDate *endDate = [fmt dateFromString:cellSecondDemo.taskEndTimeM];
//    NSString *begin = [fmt2 stringFromDate:beginDate];
//    NSString *end = [fmt2 stringFromDate:endDate];
    return publicTime;
}



@end
