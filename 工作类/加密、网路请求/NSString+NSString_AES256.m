//
//  NSString+NSString_AES256.m
//  work
//
//  Created by 郭超 on 16/1/19.
//  Copyright © 2016年 space 5. All rights reserved.
//

#import "NSString+NSString_AES256.h"
#import <CommonCrypto/CommonCryptor.h>
#import "GTMBase64.h"


//#define gkey			  @"" //自行修改
//#define gIv             @"" //自行修改
@implementation NSString (NSString_AES256)

-(NSString *) aes256_encrypt:(NSString *)key
{
  //  const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    
//    NSInteger lenth =[self string:self];
//    NSInteger b =self.length;
    NSData * data =[self dataUsingEncoding:NSUTF8StringEncoding];
   // NSData *data = [NSData dataWithBytes:cstr length:[self length]];
    //对数据进行加密
    NSData *result = [data aes256_encrypt:key];
    
    //转换为2进制字符串
    if (result && result.length > 0) {
        
        Byte *datas = (Byte*)[result bytes];
        NSMutableString *output = [NSMutableString stringWithCapacity:result.length * 2];
        for(int i = 0; i < result.length; i++){
            [output appendFormat:@"%02x", datas[i]];
        }
        return output;
    }
    return nil;
}

-(NSString *) aes256_decrypt:(NSString *)key
{
    //转换为2进制Data
   
    NSMutableData *data = [NSMutableData dataWithCapacity:[self length] / 2];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i;
    for (i=0; i <[self length] / 2; i++) {
        byte_chars[0] = [self characterAtIndex:i*2];
        byte_chars[1] = [self characterAtIndex:i*2+1];
        whole_byte = strtol(byte_chars, NULL, 16);
        [data appendBytes:&whole_byte length:1];
    }
    //对数据进行解密
    NSData* result = [data aes256_decrypt:key];
    if (result && result.length > 0) {
        return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
    }
    return nil;
}

//
//-(NSString *)aes256_encrypt:(NSString *)key
//{
//    char keyPtr[kCCKeySizeAES128+1];
//    memset(keyPtr, 0, sizeof(keyPtr));
//    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
//    
//    char ivPtr[kCCBlockSizeAES128+1];
//    memset(ivPtr, 0, sizeof(ivPtr));
//    [key getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
//    
//    NSData* data = [self dataUsingEncoding:NSUTF8StringEncoding];
//    NSUInteger dataLength = [data length];
//    
//    int diff = kCCKeySizeAES128 - (dataLength % kCCKeySizeAES128);
//    int newSize = 0;
//    
//    if(diff > 0)
//    {
//        newSize = dataLength + diff;
//    }
//    
//    char dataPtr[newSize];
//    memcpy(dataPtr, [data bytes], [data length]);
//    for(int i = 0; i < diff; i++)
//    {
//        dataPtr[i + dataLength] = 0x00;
//    }
//    
//    size_t bufferSize = newSize + kCCBlockSizeAES128;
//    void *buffer = malloc(bufferSize);
//    memset(buffer, 0, bufferSize);
//    
//    size_t numBytesCrypted = 0;
//    
//    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
//                                          kCCAlgorithmAES128,
//                                          0x0000 | kCCOptionECBMode | kCCOptionPKCS7Padding ,               //No padding
//                                          keyPtr,
//                                          kCCKeySizeAES128,
//                                          ivPtr,
//                                          dataPtr,
//                                          sizeof(dataPtr),
//                                          buffer,
//                                          bufferSize,
//                                          &numBytesCrypted);
//    
//    if (cryptStatus == kCCSuccess) {
//        NSData *resultData = [NSData dataWithBytesNoCopy:buffer length:numBytesCrypted];
//        
//            //转换为2进制字符串
//            if (resultData && resultData.length > 0) {
//        
//                Byte *datas = (Byte*)[resultData bytes];
//                NSMutableString *output = [NSMutableString stringWithCapacity:resultData.length * 2];
//                for(int i = 0; i < resultData.length; i++){
//                    [output appendFormat:@"%02x", datas[i]];
//                }
//                return output;
//            }
//       // return [GTMBase64 stringByEncodingData:resultData];
//    }
//    free(buffer);
//    return nil;
//}
//
//-(NSString *)aes256_decrypt:(NSString *)key
//{
//    char keyPtr[kCCKeySizeAES128 + 1];
//    memset(keyPtr, 0, sizeof(keyPtr));
//    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
//    
//    char ivPtr[kCCBlockSizeAES128 + 1];
//    memset(ivPtr, 0, sizeof(ivPtr));
//    [key getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
//    
//    NSData *data = [GTMBase64 decodeData:[self dataUsingEncoding:NSUTF8StringEncoding]];
//    NSUInteger dataLength = [data length];
//    size_t bufferSize = dataLength + kCCBlockSizeAES128;
//    void *buffer = malloc(bufferSize);
//    
//    size_t numBytesCrypted = 0;
//    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
//                                          kCCAlgorithmAES128,
//                                          0x0000 ,
//                                          keyPtr,
//                                          kCCBlockSizeAES128,
//                                          ivPtr,
//                                          [data bytes],
//                                          dataLength,
//                                          buffer,
//                                          bufferSize,
//                                          &numBytesCrypted);
//    if (cryptStatus == kCCSuccess) {
//        NSData *resultData = [NSData dataWithBytesNoCopy:buffer length:numBytesCrypted];
//        return [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
//    }
//    free(buffer);
//    return nil;
//}


@end
