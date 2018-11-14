//
//  PublicTextfield.h
//  HJYZG
//
//  Created by HCY on 2018/8/11.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PublicTextfield : UITextField

+(PublicTextfield *)textFieldWithFrame:(CGRect )frame
                            background:(UIImage *)image
                       secureTextEntry:(BOOL)secureTextEntry
                           placeholder:(NSString *)str
                  clearsOnBeginEditing:(BOOL)clearsOnBeginEditing;

@end
