//
//  NsurlJoint.m
//  work
//
//  Created by space 5 on 15/10/20.
//  Copyright (c) 2015年 space 5. All rights reserved.
//

#import "NsurlJoint.h"

@implementation NsurlJoint
//用户
+(NSString *)servletIndentify:(NSString *)method
{
    if (reallyTest) {

    //zhenshi
    return [NSString stringWithFormat:@"http://www.comeup.com.cn:8089/upweb/security?method=%@&source=ios1.1",method];
    }else
    {
    //测试
      return [NSString stringWithFormat:@"http://m.comeup.com.cn:8088/upweb/security?method=%@&source=ios1.1",method];
        
    }

}

//任务
+(NSString *)taskIndentify:(NSString *)method
{
    if (reallyTest) {

    //zhenshi
     return [NSString stringWithFormat:@"http://www.comeup.com.cn:8089/upweb/task?method=%@&source=ios1.1",method];
    }else
    {
    //测试
    return [NSString stringWithFormat:@"http://m.comeup.com.cn:8088/upweb/task?method=%@&source=ios1.1",method];

    }

}

//任务执行
+(NSString *)taskExecuteIndentify:(NSString *)method
{
    if (reallyTest) {

    //zhengshi
     return [NSString stringWithFormat:@"http://www.comeup.com.cn:8089/upweb/taskExecute?method=%@&source=ios1.1",method];
    }else{
    //测试
     return [NSString stringWithFormat:@"http://m.comeup.com.cn:8088/upweb/taskExecute?method=%@&source=ios1.1",method];

    }
}

//msg
+(NSString *)msgIndentify:(NSString *)method
{
    if (reallyTest) {
    //zhenshi
    return [NSString stringWithFormat:@"http://www.comeup.com.cn:8089/upweb/msg?method=%@&source=ios1.1",method];
    }else
    {
    //测试
    return [NSString stringWithFormat:@"http://m.comeup.com.cn:8088/upweb/msg?method=%@&source=ios1.1",method];
     
    }

}
+(NSString *)shareMsgIndentify:(NSString *)method
{
    if (reallyTest) {

    //zhenshi
    return [NSString stringWithFormat:@"http://www.comeup.com.cn:9000/upshare/msg?method=%@&source=ios1.1",method];
    }else
    {
    //测试
         return [NSString stringWithFormat:@"http://m.comeup.com.cn:8089/upshare/msg?method=%@&source=ios1.1",method];
    }

}
@end
