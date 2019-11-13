//
//  TimeUtils.h
//  work
//
//  Created by space 5 on 15/11/5.
//  Copyright (c) 2015年 space 5. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeUtils : NSObject
+(NSString *)intervalSinceNow: (NSString *) theDate;

+(NSString *)thePublicTime:(NSString *)publicTime;
@end
