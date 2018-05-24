//
//  ModuleTwoProvider.m
//  ProtocolModuleDemo
//
//  Created by ru on 2018/5/24.
//  Copyright © 2018年 ru. All rights reserved.
//

#import "ModuleTwoProvider.h"
#import "TwoViewController.h"

@implementation ModuleTwoProvider

//实现单利
+ (ModuleTwoProvider *)shareProvider {
    static ModuleTwoProvider *provider = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        provider = [[ModuleTwoProvider alloc] init];
    });
    return provider;
}

+ (id)getModuleInstance {
    return [ModuleTwoProvider shareProvider];
}


//首先  在模块中心 注册对应的协议 跟协议提供者
+ (void)load {
    [[ModuleServiceCenter shareCenter] registerService:@protocol(ModuleTwoProtocol) forProvider:[self class]];
}

- (id)gotoTwoVC {
    TwoViewController *vc = [[TwoViewController alloc] init];
    
    return vc;
}

//传参数的话 就这么穿
- (id)gotoTwoVCWithName:(NSString *)name {
    TwoViewController *vc = [[TwoViewController alloc] init];
    vc.name = name;
    return vc;
}


@end
