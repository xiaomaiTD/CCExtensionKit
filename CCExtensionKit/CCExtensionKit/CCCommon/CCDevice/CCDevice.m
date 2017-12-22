//
//  CCDevice.m
//  CCLocalLibrary
//
//  Created by 冯明庆 on 14/11/2017.
//  Copyright © 2017 冯明庆. All rights reserved.
//

#import "CCDevice.h"

@import UIKit;
#import <sys/utsname.h>

@implementation CCDevice

+ (NSString *) ccDeviceInfo {
    struct utsname systemInfo;
    uname(&systemInfo);
    return [NSString stringWithCString:systemInfo.machine
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *) ccDeviceType {
#if TARGET_IPHONE_SIMULATOR
    CGFloat fS = UIScreen.mainScreen.scale;
    CGFloat fW = UIScreen.mainScreen.bounds.size.width * fS;
    CGFloat fH = UIScreen.mainScreen.bounds.size.height * fS;
    
    if (fW == 320.f && fH == 480.f) return @"iPhone 3GS"; // == iPhone 3
    if (fW == 640.f && fH == 960.f) return @"iPhone 4s"; // == iPhone 4
    if (fW == 640.f && fH == 1136.f) return @"iPhone SE"; // == iPhone 5 / 5c / 5s
    if (fW == 750.f && fH == 1134.f) return @"iPhone 8"; // == iPhone 6 / 6s
    if (fW == 1080.f && fH == 1920.f) return @"iPhone 8 Plus"; // == iPhone 6 Plus / 6s Plus / 7 Plus
    if (fW == 1125.f && fH == 2436.f) return @"iPhone X";
    
    if (fW == 768.f && fH == 1024.f) return @"iPad Mini"; // == iPad 2
    if (fW == 1536.f && fH == 2048.f) return @"iPad 4"; // == iPad 3
    if (fW == 2048.f && fH == 1536.f) return @"iPad Pro"; // == iPad Air (9.7 inch)
    if (fW == 2732.f && fH == 2048.f) return @"iPad Pro"; // == iPad Air (12.9 inch)
    
    return @"Unknow" ;
#else
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    if([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4s";
    if([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    if([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    if([platform isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    if([platform isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    if([platform isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    if([platform isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    if([platform isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    if([platform isEqualToString:@"iPhone10,6"]) return @"iPhone X";
    if([platform isEqualToString:@"iPod1,1"]) return @"iPod Touch 1G";
    if([platform isEqualToString:@"iPod2,1"]) return @"iPod Touch 2G";
    if([platform isEqualToString:@"iPod3,1"]) return @"iPod Touch 3G";
    if([platform isEqualToString:@"iPod4,1"]) return @"iPod Touch 4G";
    if([platform isEqualToString:@"iPod5,1"]) return @"iPod Touch 5G";
    if([platform isEqualToString:@"iPad1,1"]) return @"iPad 1G";
    if([platform isEqualToString:@"iPad2,1"]) return @"iPad 2";
    if([platform isEqualToString:@"iPad2,2"]) return @"iPad 2";
    if([platform isEqualToString:@"iPad2,3"]) return @"iPad 2";
    if([platform isEqualToString:@"iPad2,4"]) return @"iPad 2";
    if([platform isEqualToString:@"iPad2,5"]) return @"iPad Mini 1G";
    if([platform isEqualToString:@"iPad2,6"]) return @"iPad Mini 1G";
    if([platform isEqualToString:@"iPad2,7"]) return @"iPad Mini 1G";
    if([platform isEqualToString:@"iPad3,1"]) return @"iPad 3";
    if([platform isEqualToString:@"iPad3,2"]) return @"iPad 3";
    if([platform isEqualToString:@"iPad3,3"]) return @"iPad 3";
    if([platform isEqualToString:@"iPad3,4"]) return @"iPad 4";
    if([platform isEqualToString:@"iPad3,5"]) return @"iPad 4";
    if([platform isEqualToString:@"iPad3,6"]) return @"iPad 4";
    if([platform isEqualToString:@"iPad4,1"]) return @"iPad Air";
    if([platform isEqualToString:@"iPad4,2"]) return @"iPad Air";
    if([platform isEqualToString:@"iPad4,3"]) return @"iPad Air";
    if([platform isEqualToString:@"iPad4,4"]) return @"iPad Mini 2G";
    if([platform isEqualToString:@"iPad4,5"]) return @"iPad Mini 2G";
    if([platform isEqualToString:@"iPad4,6"]) return @"iPad Mini 2G";
    if([platform isEqualToString:@"iPad4,7"]) return @"iPad Mini 3";
    if([platform isEqualToString:@"iPad4,8"]) return @"iPad Mini 3";
    if([platform isEqualToString:@"iPad4,9"]) return @"iPad Mini 3";
    if([platform isEqualToString:@"iPad5,1"]) return @"iPad Mini 4";
    if([platform isEqualToString:@"iPad5,2"]) return @"iPad Mini 4";
    if([platform isEqualToString:@"iPad5,3"]) return @"iPad Air 2";
    if([platform isEqualToString:@"iPad5,4"]) return @"iPad Air 2";
    if([platform isEqualToString:@"iPad6,3"]) return @"iPad Pro 9.7";
    if([platform isEqualToString:@"iPad6,4"]) return @"iPad Pro 9.7";
    if([platform isEqualToString:@"iPad6,7"]) return @"iPad Pro 12.9";
    if([platform isEqualToString:@"iPad6,8"]) return @"iPad Pro 12.9";
    if([platform isEqualToString:@"i386"]) return @"iPhone Simulator";
    if([platform isEqualToString:@"x86_64"]) return @"iPhone Simulator";
    return platform;
#endif
}

+ (NSString *) ccSystemVersion {
    return @(UIDevice.currentDevice.systemVersion.floatValue).stringValue ;
}

+ (NSString *) ccDeviceUUID {
    return UIDevice.currentDevice.identifierForVendor.UUIDString;
}

+ (NSString *) ccDeviceResolution {
    CGFloat w = UIScreen.mainScreen.bounds.size.width;
    CGFloat h = UIScreen.mainScreen.bounds.size.height;
    CGFloat scale = UIScreen.mainScreen.scale;
    return [NSString stringWithFormat:@"%ld*%ld",(long)(h * scale),(NSInteger)(w * scale)];
}

+ (NSString *) ccDeviceRect {
    return NSStringFromCGRect(UIScreen.mainScreen.bounds);
}

@end
