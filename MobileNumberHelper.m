//
//  MobileNumberHelper.m
//  PhoneCheckDemo
//
//  Created by Arlexovincy on 14-3-2.
//  Copyright (c) 2014年 Arlexovincy. All rights reserved.
//

#import "MobileNumberHelper.h"

@implementation MobileNumberHelper

/**
 *  判断是否为手机号码格式
 *
 *  @param mobileNumString 需要被判断的字符串
 *
 *  @return 是否为手机号码
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNumString
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString *MOBILEString = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    
    /**
     * 中国移动：China Mobile
     * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     */
    
    NSString *CMString = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    
    /**
     * 中国联通：China Unicom
     * 130,131,132,152,155,156,185,186
     */
    
    NSString * CUString = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    
    /**
     * 中国电信：China Telecom
     * 133,1349,153,180,189
     */
    
    NSString * CTString = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    
    /**
     * 大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029
     * 号码：七位或八位
     */
    
    // NSString * PHSString = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILEString];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CMString];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CUString];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CTString];
    
    if (([regextestmobile evaluateWithObject:mobileNumString] == YES)
        || ([regextestcm evaluateWithObject:mobileNumString] == YES)
        || ([regextestct evaluateWithObject:mobileNumString] == YES)
        || ([regextestcu evaluateWithObject:mobileNumString] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

@end
