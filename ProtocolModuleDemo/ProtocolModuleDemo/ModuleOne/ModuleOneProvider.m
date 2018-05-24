//
//  ModuleOneProvider.m
//  ProtocolModuleDemo
//
//  Created by ru on 2018/5/24.
//  Copyright © 2018年 ru. All rights reserved.
//

#import "ModuleOneProvider.h"
#import "OneViewController.h"


@implementation ModuleOneProvider

//实现单利
+ (ModuleOneProvider *)shareProvider {
    static ModuleOneProvider *provider = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        provider = [[ModuleOneProvider alloc] init];
    });
    return provider;
}


//首先  在模块中心 注册对应的协议 跟协议提供者
+ (void)load {
    [[ModuleServiceCenter shareCenter] registerService:@protocol(ModuleOneProtocol) forProvider:[self class]];
}

- (id)gotoOneVC {
    
    OneViewController *vc = [[OneViewController alloc] init];
    
    return vc;
    
    
}

//提供获取协议提供者单利的方法
+ (id)getModuleInstance {
    return [ModuleOneProvider shareProvider];
}

@end
