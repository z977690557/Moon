//
//  NsurlConnection.m
//  MyBeautiful
//
//  Created by MS on 15/8/27.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "NsurlConnection.h"
#import "AFNetworking.h"
#import "Utils.h"
#import "UIView+Toast.h"
#import "NSData+NSData_AES256.h"
#import "NSString+NSString_AES256.h"
#import "NsurlJoint.h"
@implementation NsurlConnection
{
    UIView * view;
    NSTimer* myTimer;
}
-(instancetype)initWithUrl:(NSString *)url target:(id)target selector:(SEL)selector tag:(NSInteger)tag paramenters:(NSDictionary *)paramenters
{
    if (self =[super init]) {
        self.url = url;
        self.target =target;
        self.selector =selector;
        self.tag =tag;
        self.paramenters =paramenters;
    }
    return self;
}
+(instancetype)connectionWithUrl:(NSString *)url target:(id)target selector:(SEL)selector tag:(NSInteger)tag paramenters:(NSDictionary *)paramenters
{

    return [[self alloc] initWithUrl:url target:target selector:selector tag:tag paramenters:paramenters];
}

-(void)start
{
    
    self.data =[[NSMutableData alloc]init];

    AFHTTPRequestOperationManager * manage =[AFHTTPRequestOperationManager manager];
    
    manage.responseSerializer =[AFHTTPResponseSerializer serializer];
    manage.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    //设置Cookies
    NSData *cookiesdata = [[NSUserDefaults standardUserDefaults] objectForKey:@"userCookies"];
    if([cookiesdata length]) {
         NSHTTPCookie *cookie = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesdata];
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
    }
    
    [manage POST:_url parameters:self.paramenters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //赋值
        if (self.isDecode) {
            self.data =[NSMutableData dataWithData:responseObject];
            NSDictionary * jsonDict =[NSJSONSerialization JSONObjectWithData:self.data options:0 error:nil];
            if ([[jsonDict objectForKey:@"error"]isEqualToString:@"1000"]) {
                [self autoLogin];
                return ;
            }
            [self.target performSelector:self.selector withObject:self afterDelay:0];
            return ;
        }
        NSDictionary * dict =[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        if ([[dict objectForKey:@"error"]isEqualToString:@"1000"]) {
            [self autoLogin];
            return;
        }
        
        NSMutableDictionary * muDict =[NSMutableDictionary dictionaryWithDictionary:dict];
        NSString * content =[dict objectForKey:@"content"];
        NSData * newData =[[NSData alloc]init];
        NSString * str2 =[[NSString alloc]init];
        str2 =[content aes256_decrypt:AES];
        newData =[str2 dataUsingEncoding:NSUTF8StringEncoding];
        NSString * str =[[NSString alloc]initWithData:newData encoding:NSUTF8StringEncoding];
        [muDict setValue:str forKey:@"content"];
        NSData * chuanData =[NSJSONSerialization dataWithJSONObject:muDict options:0 error:nil];
        self.data =[NSMutableData dataWithData:chuanData];
        [self.target performSelector:self.selector withObject:self afterDelay:0];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       // NSLog(@"网络请求失败");
        
        UIWindow * window =[[UIApplication sharedApplication].windows lastObject];
        view =[[UIView alloc]initWithFrame:CGRectMake(SCREENW/2-60, SCREENH/2-50,120, 20)];
        [window addSubview:view];
        [view makeToast:@"网络连接失败" duration:2 position:CSToastPositionCenter];
         myTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollTimer) userInfo:nil repeats:NO];
    
    }];

}
-(void)startPutImage
{
    NSData * imageData1 = UIImageJPEGRepresentation(self.image1, 1);
    NSData * imageData2 = UIImageJPEGRepresentation(self.image2, 1);
    NSData * imageData3 = UIImageJPEGRepresentation(self.image3, 1);
    self.data =[[NSMutableData alloc]init];
    
    AFHTTPRequestOperationManager * manage =[AFHTTPRequestOperationManager manager];
    manage.responseSerializer =[AFHTTPResponseSerializer serializer];
    manage.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    //设置Cookies
    NSData *cookiesdata = [[NSUserDefaults standardUserDefaults] objectForKey:@"userCookies"];
    if([cookiesdata length]) {
        NSHTTPCookie *cookie = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesdata];
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
    }
        [manage POST:_url parameters:self.paramenters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            if (self.image1!=nil) {
                [formData appendPartWithFileData:imageData1 name:self.imageName1 fileName:@"1.png" mimeType:@"png/jpg"];
            }
            if (self.image2!=nil) {
                [formData appendPartWithFileData:imageData2 name:self.imageName2 fileName:@"2.png" mimeType:@"image/png/jpg"];
            }
            if (self.image3!=nil) {
                [formData appendPartWithFileData:imageData3 name:self.imageName3 fileName:@"3.png" mimeType:@"image/png/jpg"];
            }
    
        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSDictionary * dict =[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
            if ([[dict objectForKey:@"error"]isEqualToString:@"1000"]) {
                [self autoLogin];
                return ;
            }
            
            NSMutableDictionary * muDict =[NSMutableDictionary dictionaryWithDictionary:dict];
            NSString * content =[dict objectForKey:@"content"];
            NSData * newData =[[NSData alloc]init];
            NSString * str2 =[[NSString alloc]init];
            str2 =[content aes256_decrypt:AES];
            newData =[str2 dataUsingEncoding:NSUTF8StringEncoding];
            NSString * str =[[NSString alloc]initWithData:newData encoding:NSUTF8StringEncoding];
            [muDict setValue:str forKey:@"content"];
            NSData * chuanData =[NSJSONSerialization dataWithJSONObject:muDict options:0 error:nil];
            self.data =[NSMutableData dataWithData:chuanData];
            [self.target performSelector:self.selector withObject:self afterDelay:0];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            UIWindow * window =[[UIApplication sharedApplication].windows lastObject];
            view =[[UIView alloc]initWithFrame:CGRectMake(SCREENW/2-60, SCREENH/2-50,120, 20)];
            [window addSubview:view];
            [view makeToast:@"网络连接失败" duration:2 position:CSToastPositionCenter];
            myTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollTimer) userInfo:nil repeats:NO];
        }];
}


-(void)autoLogin
{
    
    //自动登录
    NSString * taskList =[NsurlJoint servletIndentify:@"login"];
  //  if ([[NSUserDefaults standardUserDefaults]objectForKey:@"phone"]&&[[NSUserDefaults standardUserDefaults]objectForKey:@"passWord"]) {
        
        
        NSString * phoneNum =[[NSUserDefaults standardUserDefaults]objectForKey:@"phone"];
        NSString * passWord =[[NSUserDefaults standardUserDefaults]objectForKey:@"passWord"];
        
        NSDictionary *dict =@{@"phone":phoneNum,@"password":passWord};

    AFHTTPRequestOperationManager * manage =[AFHTTPRequestOperationManager manager];
    manage.responseSerializer =[AFHTTPResponseSerializer serializer];
    [manage POST:taskList parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * jsoDict =[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        if ([[jsoDict objectForKey:@"error"]isEqualToString:@"0"]) {
            [self getAndSaveCookieurl:taskList dict:dict];
            
            if (self.image1==nil&&self.image2==nil&&self.image3==nil) {
                [self start];
            }else{
            
                [self startPutImage];
            }

            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

- (void)getAndSaveCookieurl:(NSString *)url dict:(NSDictionary *)dict
{
    
    NSString *urlString = url;
    
    //请求一个网址，即可分配到cookie
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:urlString parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //获取cookie
        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
        for (NSHTTPCookie *tempCookie in cookies) {
            //打印获得的cookie
            if ([tempCookie.name isEqualToString:@"JSESSIONID"]) {
                NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tempCookie];
                [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"userCookies"];
                
            }
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        nil;
    }];
}


-(void)scrollTimer
{
  [view removeFromSuperview];
  [myTimer invalidate];
}
-(void)stop
{
   
}
@end
