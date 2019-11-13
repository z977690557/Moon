//
//  NSData+NSData_AES256.h
//  work
//
//  Created by 郭超 on 16/1/19.
//  Copyright © 2016年 space 5. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonDigest.h>
@interface NSData (NSData_AES256)
-(NSData *) aes256_encrypt:(NSString *)key ;

-(NSData *) aes256_decrypt:(NSString *)key;
@end
