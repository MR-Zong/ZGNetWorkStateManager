//
//  ViewController.m
//  ZGNetworkStateManager
//
//  Created by Zong on 16/3/7.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ViewController.h"
#import "ZGNetworkStateManager.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1,首先启动网络状态监听的通知
    [[ZGNetworkStateManager shareNetworkStateManager] startNotifier];
    
    // 2,查看当前网络状态
    NetworkStatus networkStatus = [[ZGNetworkStateManager shareNetworkStateManager] checkNetworkState];
    if (networkStatus == ReachableViaWiFi) {
        NSLog(@"通过wifi联网中.....");
    }else if (networkStatus == ReachableViaWWAN){
        NSLog(@"通过普通网络联网");
    }else {
        NSLog(@"没有网络连接");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
