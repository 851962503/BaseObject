//
//  MPCHomeTableItem.h
//  BaseObject
//
//  Created by mopucheng on 2018/7/25.
//  Copyright © 2018年 mopucheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MPCHomeTableItem : UIControl
@property (nonatomic,strong)UIView        *bgView;
@property (nonatomic,strong)UIImageView   *imageView;
@property (nonatomic,strong)UILabel       *titleLabel;
@property (nonatomic,strong)UIColor       *titleColor;
@property (nonatomic)       int           pageNumber;
@property (nonatomic,strong)UIImage       *imgStr;
@property (nonatomic,strong)UIImage       *selectImg;
@property (nonatomic,assign)BOOL isSelect;
@property (nonatomic)BOOL  notificationMessageHidden;

- (id)initWithFrame:(CGRect)frame imageName:(NSString *)imgStr selectImg:(NSString *)selectImg title:(NSString *)title;
- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)img selectImg:(UIImage *)selectImg title:(NSString *)title;
@end
