//
//  ZGNetworkStateManager.h
//  ZGNetworkStateManager
//
//  Created by Zong on 16/3/7.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface ZGNetworkStateManager : NSObject

+ (instancetype)shareNetworkStateManager;
- (void)startNotifier;
- (void)stopNotifier;
- (NetworkStatus)checkNetworkState;

@end
