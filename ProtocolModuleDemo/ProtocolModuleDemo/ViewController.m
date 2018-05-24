//
//  ViewController.m
//  ProtocolModuleDemo
//
//  Created by ru on 2018/5/24.
//  Copyright © 2018年 ru. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.center = self.view.center;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}


- (void)btnClick {
    //首先从模块中心获取模块的提供者
    id<ModuleTwoProtocol> provider = [[ModuleServiceCenter shareCenter]getProviderByService:@protocol(ModuleTwoProtocol)];
    //获取对应的控制器
    UIViewController *vc = [provider gotoTwoVC];
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
