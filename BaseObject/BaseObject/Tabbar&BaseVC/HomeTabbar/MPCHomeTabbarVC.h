//
//  MPCHomeTabbarVC.h
//  BaseObject
//
//  Created by mopucheng on 2018/7/25.
//  Copyright © 2018年 mopucheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MPCHomeTableItem;
@interface MPCHomeTabbarVC : UITabBarController<UINavigationControllerDelegate>{
    
    NSArray        *_bottomArray;            //按钮数组
    UIView         *_bottomView;             //底部视图
    //    UIView         *_tabBarImageView;        //tab背景视图
}


@property (nonatomic,strong) UIView         *tabBarImageView;
@property (nonatomic, strong) UIView *myRingItem;
- (void)tabbarItemSelected:(MPCHomeTableItem *)item;
- (void)hideTabbar:(BOOL)flag;

@end
