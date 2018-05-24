//
//  ModuleServiceCenter.m
//  ProtocolModuleDemo
//
//  Created by ru on 2018/5/24.
//  Copyright © 2018年 ru. All rights reserved.
//

#import "ModuleServiceCenter.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface ModuleServiceCenter ()


/** 存储协议的字典 */
@property (nonatomic, strong) NSMutableDictionary        *serviceProviderMap;

@end

@implementation ModuleServiceCenter

+ (instancetype)shareCenter
{
    static ModuleServiceCenter *center;
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        center = [[ModuleServiceCenter alloc] init];
    });
    
    return center;
}

- (void)registerService:(Protocol *)protocol forProvider:(Class)provider {
    if (!protocol || !provider) {
        //如果都不存在
        return;
    }
   NSString *protocolName = [NSString stringWithCString:protocol_getName(protocol) encoding:NSUTF8StringEncoding];
    NSString *providerName = [NSString stringWithCString:class_getName(provider) encoding:NSUTF8StringEncoding];
    [self.serviceProviderMap setValue:providerName forKey:protocolName];
}

- (id)getProviderByService:(Protocol *)protocol {
    
    if (!protocol) {
        return nil;
    }
    NSString *protocolName = [NSString stringWithCString:protocol_getName(protocol) encoding:NSUTF8StringEncoding];
    NSString *className = [self.serviceProviderMap valueForKey:protocolName];
    
    Class class = NSClassFromString(className);
    
    SEL sel = @selector(getModuleInstance);
    
    Method method = class_getClassMethod(class, sel);
    
    
    if (method) {
        return objc_msgSend(class, sel);
    }
    
    return class;
}


#pragma mark - lazy
- (NSMutableDictionary *)serviceProviderMap {
    if (!_serviceProviderMap) {
        _serviceProviderMap = [NSMutableDictionary dictionary];
    }
    return _serviceProviderMap;
}


@end
