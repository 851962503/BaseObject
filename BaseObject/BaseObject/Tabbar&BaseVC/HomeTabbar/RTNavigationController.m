//
//  RTNavigationController.m
//  ringtone
//
//  Created by WCL on 16/5/4.
//  Copyright © 2016年 WCL,Ltd. All rights reserved.
//

#import "RTNavigationController.h"

@interface RTNavigationController ()

@end

@implementation RTNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // self - 导航控制器
    if (self.viewControllers.count) { // 不是根控制器
        // push的时候隐藏底部条
        viewController.hidesBottomBarWhenPushed = YES;
    }
    // 调用系统默认做法,因为只有系统才知道怎么做push
    [super pushViewController:viewController animated:animated];
}


@end
