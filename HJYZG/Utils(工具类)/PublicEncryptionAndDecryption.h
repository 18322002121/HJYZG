//
//  PublicEncryptionAndDecryption.h
//  mayizhisheng
//
//  Created by HCY on 2018/8/31.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicEncryptionAndDecryption : NSObject





/** base64加密 */
+ (NSString *)base64EncodeString:(NSString *)string;
/** base64解密 */
+ (NSString *)base64DecodeString:(NSString *)string;
+ (NSString *)MD5ForLower32Bate:(NSString *)str;
+ (NSString *)MD5ForUpper32Bate:(NSString *)str;
+ (NSString *)MD5ForUpper16Bate:(NSString *)str;
+ (NSString *)MD5ForLower16Bate:(NSString *)str;

@end
