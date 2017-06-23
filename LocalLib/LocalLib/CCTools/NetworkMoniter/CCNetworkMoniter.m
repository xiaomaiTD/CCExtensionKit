//
//  CCNetworkMoniter.m
//  CCLocalLibrary
//
//  Created by 冯明庆 on 2017/4/27.
//  Copyright © 2017年 冯明庆. All rights reserved.
//

#import "CCNetworkMoniter.h"

#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFNetworkActivityIndicatorManager.h>
#import <AFNetworking/AFNetworkReachabilityManager.h>

#import <CoreTelephony/CTTelephonyNetworkInfo.h>

static CCNetworkMoniter *_moniter = nil;

NSString * const _CC_NETWORK_STATUS_CHANGE_NOTIFICATION_ = @"_CC_NETWORK_STATUS_CHANGE_NOTIFICATION_";
NSString * const _CC_NETWORK_STATUS_KEY_NEW_ = @"CC_NETWORK_STATUS_KEY_NEW";
NSString * const _CC_NETWORK_STATUS_KEY_OLD_ = @"CC_NETWORK_STATUS_KEY_OLD";

@interface CCNetworkMoniter ()

@property (nonatomic , strong) AFNetworkActivityIndicatorManager *activityManager ;
@property (nonatomic , strong) AFNetworkReachabilityManager *reachabilityManager ;
@property (nonatomic , strong) CTTelephonyNetworkInfo *netwotkInfo ;

@property (nonatomic , strong , readonly) NSArray *arrayString_2G ;
@property (nonatomic , strong , readonly) NSArray *arrayString_3G ;
@property (nonatomic , strong , readonly) NSArray *arrayString_4G ;

- (void) ccReachabilityMoniter ;

- (CCNetworkEnvironment) ccCaptureCurrentEnvironmentWithStatus : (AFNetworkReachabilityStatus) status ;

@end

@implementation CCNetworkMoniter

+ (instancetype) sharedNetworkMoniter {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _moniter = [[CCNetworkMoniter alloc] init];
        [_moniter ccReachabilityMoniter];
    });
    return _moniter;
}

- (void) ccReachabilityMoniter {
    self.activityManager = [AFNetworkActivityIndicatorManager sharedManager];
    self.activityManager.enabled = YES;
    [[NSUserDefaults standardUserDefaults] setInteger:-1 forKey:_CC_NETWORK_STATUS_KEY_NEW_];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _moniter.reachabilityManager = [AFNetworkReachabilityManager sharedManager];
    __weak typeof(self) pSelf = self;
    [_moniter.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        [pSelf ccCaptureCurrentEnvironmentWithStatus:status];
    }];
    [_moniter.reachabilityManager startMonitoring];
}

- (CCNetworkEnvironment) ccCaptureCurrentEnvironmentWithStatus : (AFNetworkReachabilityStatus) status {
    NSString *stringAccess = self.netwotkInfo.currentRadioAccessTechnology ;
    CCNetworkEnvironment environment = CCNetworkEnvironmentUnknow ;
    if ([[UIDevice currentDevice] systemVersion].floatValue > 7.f) {
        if ([self.arrayString_4G containsObject:stringAccess])
            environment = CCNetworkEnvironment4G;
        else if ([self.arrayString_3G containsObject:stringAccess])
            environment = CCNetworkEnvironment3G;
        else if ([self.arrayString_2G containsObject:stringAccess])
            environment = CCNetworkEnvironment2G;
        
    }
    else environment = (CCNetworkEnvironment) status;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:_CC_NETWORK_STATUS_CHANGE_NOTIFICATION_
                                                        object:nil
                                                      userInfo:@{_CC_NETWORK_STATUS_KEY_NEW_ : @(environment),
                                                                 _CC_NETWORK_STATUS_KEY_OLD_ : @([[NSUserDefaults standardUserDefaults] integerForKey:_CC_NETWORK_STATUS_KEY_NEW_])}];
    [[NSUserDefaults standardUserDefaults] setInteger:status
                                               forKey:_CC_NETWORK_STATUS_KEY_NEW_];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return environment;
}

- (CCNetworkEnvironmentType) ccEnvironmentType {
    NSInteger integerStatus = [[NSUserDefaults standardUserDefaults] integerForKey:_CC_NETWORK_STATUS_KEY_NEW_];
    if (integerStatus <= 0)
        return CCNetworkEnvironmentTypeNotConnected;
    if (integerStatus == 1 || integerStatus == 3 || integerStatus == 4)
        return CCNetworkEnvironmentTypeWeak;
    if (integerStatus == 2 || integerStatus == 5)
        return CCNetworkEnvironmentTypeStrong;
    return CCNetworkEnvironmentTypeStrong;
}

#pragma mark - Getter
- (CTTelephonyNetworkInfo *)netwotkInfo {
    if (_netwotkInfo) return _netwotkInfo;
    _netwotkInfo = [[CTTelephonyNetworkInfo alloc] init];
    return _netwotkInfo;
}

- (NSArray *)arrayString_2G {
    return @[CTRadioAccessTechnologyEdge,
             CTRadioAccessTechnologyGPRS,
             CTRadioAccessTechnologyCDMA1x];
}
- (NSArray *)arrayString_3G {
    return @[CTRadioAccessTechnologyHSDPA,
             CTRadioAccessTechnologyWCDMA,
             CTRadioAccessTechnologyHSUPA,
             CTRadioAccessTechnologyCDMAEVDORev0,
             CTRadioAccessTechnologyCDMAEVDORevA,
             CTRadioAccessTechnologyCDMAEVDORevB,
             CTRadioAccessTechnologyeHRPD];
}
- (NSArray *)arrayString_4G {
    return @[CTRadioAccessTechnologyLTE];
}

@end
