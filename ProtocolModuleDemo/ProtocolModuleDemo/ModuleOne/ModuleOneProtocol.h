//
//  ModuleOneProtocol.h
//  ProtocolModuleDemo
//
//  Created by ru on 2018/5/24.
//  Copyright © 2018年 ru. All rights reserved.
//

#import "ModuleServiceProtocol.h"


//模块一的协议
@protocol ModuleOneProtocol <ModuleServiceProtocol>

- (id)gotoOneVC;

@end
