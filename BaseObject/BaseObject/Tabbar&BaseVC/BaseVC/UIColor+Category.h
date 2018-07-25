//
//  UIColor+Category.h
//  JobProject
//
//  Created by CoDancer on 2016/12/14.
//  Copyright © 2016年 CoDancer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)

+ (UIColor *)colorWithR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b;

+ (UIColor *)customRedColor;

+ (UIColor *)customGrayColor;

+ (UIColor *)colorWithHex:(NSString *)string;

+ (UIColor *)backgroundColor;

@end
