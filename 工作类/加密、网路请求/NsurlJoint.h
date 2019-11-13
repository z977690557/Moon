//
//  NsurlJoint.h
//  work
//
//  Created by space 5 on 15/10/20.
//  Copyright (c) 2015年 space 5. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NsurlJoint : NSObject

//用户
+(NSString *)servletIndentify:(NSString *)method;

//任务
+(NSString *)taskIndentify:(NSString *)method;

//任务执行
+(NSString *)taskExecuteIndentify:(NSString *)method;

//msg
+(NSString *)msgIndentify:(NSString *)method;

+(NSString *)shareMsgIndentify:(NSString *)method;
@end
