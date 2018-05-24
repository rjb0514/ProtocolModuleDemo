//
//  ModuleServiceCenter.h
//  ProtocolModuleDemo
//
//  Created by ru on 2018/5/24.
//  Copyright © 2018年 ru. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ModuleServiceProtocol.h"
#import "ModuleOneProtocol.h"
#import "ModuleTwoProtocol.h"

@interface ModuleServiceCenter : NSObject

+ (instancetype)shareCenter;

- (void)registerService:(Protocol *)protocol forProvider:(Class)provider;

- (id)getProviderByService:(Protocol *)protocol;

@end
