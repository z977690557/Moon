//
//  NSString+NSString_AES256.h
//  work
//
//  Created by 郭超 on 16/1/19.
//  Copyright © 2016年 space 5. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonDigest.h>

#import "NSData+NSData_AES256.h"
@interface NSString (NSString_AES256)

-(NSString *) aes256_encrypt:(NSString *)key;
-(NSString *) aes256_decrypt:(NSString *)key;
@end
