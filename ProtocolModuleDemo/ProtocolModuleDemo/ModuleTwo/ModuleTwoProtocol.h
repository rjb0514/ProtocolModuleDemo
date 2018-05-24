//
//  ModuleTwoProtocol.h
//  ProtocolModuleDemo
//
//  Created by ru on 2018/5/24.
//  Copyright © 2018年 ru. All rights reserved.
//

#import "ModuleServiceProtocol.h"


//模块二的协议
@protocol ModuleTwoProtocol <ModuleServiceProtocol>

- (id)gotoTwoVC;

//传参数的话 就这么穿
- (id)gotoTwoVCWithName:(NSString *)name;

@end
