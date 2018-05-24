//
//  OneViewController.m
//  ProtocolModuleDemo
//
//  Created by ru on 2018/5/24.
//  Copyright © 2018年 ru. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"跳到Two" forState:UIControlStateNormal];
    [btn sizeToFit];
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)btnClick {
    
    //首先从模块中心获取模块的提供者
    id<ModuleTwoProtocol> provider = [[ModuleServiceCenter shareCenter]getProviderByService:@protocol(ModuleTwoProtocol)];
    //获取对应的控制器
    UIViewController *vc = [provider gotoTwoVCWithName:@"哈哈"];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
