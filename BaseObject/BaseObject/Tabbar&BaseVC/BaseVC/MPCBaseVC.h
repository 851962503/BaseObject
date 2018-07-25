//
//  MPCBaseVC.h
//  LoanWorld
//
//  Created by mopucheng on 2018/7/17.
//  Copyright © 2018年 东哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Catrgory.h"
@interface MPCBaseVC : UIViewController

@property (nonatomic, strong) NSString *titleText;
@property (nonatomic, strong) UIImage *titleImg;

@property (nonatomic, strong) NSString *leftBtnTitle;
@property (nonatomic, strong) UIImage *leftImg;

@property (nonatomic, strong) NSString *rightBtnTitle;
@property (nonatomic, strong) UIImage *rightImg;
@property (nonatomic, strong) UIFont *rightFont;

@property (nonatomic, strong) UIColor *backColor;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, assign) BOOL showLine;
@property (nonatomic, assign) BOOL isShopCaterZero;
@property (nonatomic, assign) BOOL isHiddenNav;

@property (nonatomic, strong) UIImage *alertImg;
@property (nonatomic, strong) NSString *alertText;
@property (nonatomic, strong) UIView *onView;

- (UIView *)baseNaviView;
- (void)alertViewShow;
- (void)removeAlertView;
- (void)leftBtnDidTouch;
- (void)rightBtnDidTouch;
- (void)hideLeftBtn;

- (UIButton *)getLeftBtn;
- (UIButton *)getRightBtn;
- (UIImageView *)getTitleIV;
- (UIView *)getBottomView;
@end


typedef void(^CustomNaviBlock)(BOOL);
@interface MPCBaseNavView : UIView

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *titleImg;

@property (nonatomic, strong) NSString *rightTitle;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIImage *rightImg;
@property (nonatomic, strong) UIFont *rightFont;

@property (nonatomic, strong) NSString *leftBtnTitle;
@property (nonatomic, strong) UIImage *leftImg;

@property (nonatomic, strong) UIColor *backColor;
@property (nonatomic, strong) UIColor *textColor;

@property (nonatomic, assign) BOOL showLine;
@property (nonatomic, assign) BOOL isShopCaterZero;
@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) CustomNaviBlock actionBlock;
- (void)hideLeftBtn;
- (UIButton *)getLeftBtn;
- (UIButton *)getRightBtn;
- (UIImageView *)getTitleIV;
@end
