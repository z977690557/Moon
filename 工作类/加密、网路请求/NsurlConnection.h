//
//  NsurlConnection.h
//  MyBeautiful
//
//  Created by MS on 15/8/27.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NsurlConnection : NSObject

@property (nonatomic , copy) NSString * url;
@property (nonatomic , weak) id target;
@property (nonatomic , assign)SEL selector;
@property (nonatomic ,retain) NSMutableData * data;
@property (nonatomic , assign)NSInteger tag;
@property (nonatomic ,strong)NSDictionary *paramenters;

@property (nonatomic ,strong)UIImage * image1;
@property (nonatomic ,strong)UIImage * image2;
@property (nonatomic ,strong)UIImage * image3;

@property (nonatomic ,copy)NSString *imageName1;
@property (nonatomic ,copy)NSString *imageName2;
@property (nonatomic ,copy)NSString *imageName3;

@property (nonatomic ,assign)BOOL isDecode;

-(void)start;

-(void)startPutImage;
-(void)stop;

-(instancetype)initWithUrl:(NSString *)url target:(id)target selector:(SEL)selector tag:(NSInteger)tag paramenters:(NSDictionary *)paramenters;

+(instancetype)connectionWithUrl:(NSString *)url target:(id)target selector:(SEL)selector tag:(NSInteger)tag paramenters:(NSDictionary *)paramenters;


-(NSData *) aes256_encrypt:(NSString *)key;
-(NSData *) aes256_decrypt:(NSString *)key;
@end
