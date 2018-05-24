//
//  TwoViewController.m
//  ProtocolModuleDemo
//
//  Created by ru on 2018/5/24.
//  Copyright © 2018年 ru. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"传过来的参数:--%@",self.name);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"跳到one" forState:UIControlStateNormal];
    [btn sizeToFit];
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)btnClick {
    
    //首先从模块中心获取模块的提供者
    id<ModuleOneProtocol> provider = [[ModuleServiceCenter shareCenter]getProviderByService:@protocol(ModuleOneProtocol)];
    //获取对应的控制器
    UIViewController *vc = [provider gotoOneVC];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
