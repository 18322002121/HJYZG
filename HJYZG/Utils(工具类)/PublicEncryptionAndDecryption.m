//
//  PublicEncryptionAndDecryption.m
//  mayizhisheng
//
//  Created by HCY on 2018/8/31.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "PublicEncryptionAndDecryption.h"
#import <CommonCrypto/CommonDigest.h>
@implementation PublicEncryptionAndDecryption




#pragma mark - base64加解密
/** base64加密 */
+ (NSString *)base64EncodeString:(NSString *)string{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];//把字符串转换成data二进制数据
    return [data base64EncodedStringWithOptions:0];//对二进制数据进行base64编码，返回编码后的字符串
}

/** base64解密 */
+ (NSString *)base64DecodeString:(NSString *)string{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:string options:0];//将base64编码后的字符串解码为二进制数据
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];//把二进制数据转换为字符串返回
}

#pragma mark - MD5加解密


#pragma mark - 32位 小写
+ (NSString *)MD5ForLower32Bate:(NSString *)str
{
    
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return digest;
}

#pragma mark - 32位 大写
+ (NSString *)MD5ForUpper32Bate:(NSString *)str
{
    
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02X", result[i]];
    }
    
    return digest;
}

#pragma mark - 16位 大写
+ (NSString *)MD5ForUpper16Bate:(NSString *)str
{
    
    NSString *md5Str = [self MD5ForUpper32Bate:str];
    
    NSString  *string;
    for (int i=0; i<24; i++) {
        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    return string;
}


#pragma mark - 16位 小写
+ (NSString *)MD5ForLower16Bate:(NSString *)str
{
    
    NSString *md5Str = [self MD5ForLower32Bate:str];
    
    NSString  *string;
    for (int i=0; i<24; i++) {
        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    return string;
}




@end
