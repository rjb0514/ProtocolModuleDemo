//
//  ModuleServiceProtocol.h
//  ProtocolModuleDemo
//
//  Created by ru on 2018/5/24.
//  Copyright © 2018年 ru. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ModuleServiceProtocol <NSObject>


/**
 获取每个协议的提供者实例

 @return nil
 */
+ (id)getModuleInstance;

@end
