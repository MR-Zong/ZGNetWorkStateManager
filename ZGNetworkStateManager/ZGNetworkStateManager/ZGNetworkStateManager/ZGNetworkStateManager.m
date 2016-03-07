//
//  ZGNetworkStateManager.m
//  ZGNetworkStateManager
//
//  Created by Zong on 16/3/7.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ZGNetworkStateManager.h"
#import "Reachability.h"

@interface ZGNetworkStateManager ()

@property (strong, nonatomic) Reachability *reachability;

@end

@implementation ZGNetworkStateManager

+ (instancetype)shareNetworkStateManager
{
    static ZGNetworkStateManager *_networkStateM_;
    static dispatch_once_t onceToken;
    if (!_networkStateM_) {
        dispatch_once(&onceToken, ^{
            _networkStateM_ = [[ZGNetworkStateManager alloc] init];
        });
    }
    
    return _networkStateM_;
}

- (instancetype)init
{
    if (self = [super init]) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkStateDidChange:) name:kReachabilityChangedNotification object:nil];
        self.reachability = [Reachability reachabilityForInternetConnection];
    }
    
    return self;
}


- (void)dealloc
{
    [self.reachability stopNotifier];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



- (void)startNotifier
{
    [self.reachability startNotifier];
}

- (void)stopNotifier
{
    [self.reachability stopNotifier];
}

- (void)networkStateDidChange:(NSNotification *)note
{
    [self checkNetworkState];
}

 - (void)checkNetworkState
{
    Reachability *wifiReachability = [Reachability reachabilityForLocalWiFi];
    
    Reachability *wanReachability = [Reachability reachabilityForInternetConnection];
    
    if (wifiReachability.currentReachabilityStatus != NotReachable) {
        NSLog(@"通过wifi联网中。。。");
    }else if (wanReachability.currentReachabilityStatus != NotReachable){
        NSLog(@"通过普通网络联网");
    }else {
        NSLog(@"没有网络连接");
    }
}


// 用WIFI
// [wifi currentReachabilityStatus] != NotReachable
// [conn currentReachabilityStatus] != NotReachable

// 没有用WIFI, 只用了手机网络
// [wifi currentReachabilityStatus] == NotReachable
// [conn currentReachabilityStatus] != NotReachable

// 没有网络
// [wifi currentReachabilityStatus] == NotReachable
// [conn currentReachabilityStatus] == NotReachable


@end
