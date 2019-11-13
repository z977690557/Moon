//
//  LocalPathViewController.m
//  work
//
//  Created by 郭超 on 15/11/18.
//  Copyright (c) 2015年 space 5. All rights reserved.
//

#import "LocalPathViewController.h"

@interface LocalPathViewController ()

@end

@implementation LocalPathViewController

+(NSString *)localPath:(NSString *)path pathDetial:(NSString *)pathDetial
{
    BOOL isDir =false;

    NSString *ZCACHE_PATH =[NSHomeDirectory() stringByAppendingFormat:@"/Documents"];
    
    NSString *finalPath = [[NSString alloc] initWithFormat:@"%@/temporary/%@",ZCACHE_PATH,path];
    
    if (!([[NSFileManager defaultManager] fileExistsAtPath:finalPath isDirectory:&isDir] && isDir)) {
        [[NSFileManager defaultManager] createDirectoryAtPath:finalPath
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:nil];
    }
    return [[NSString alloc]initWithFormat:@"%@/temporary/%@/%@.json",ZCACHE_PATH,path,pathDetial];
}

@end
