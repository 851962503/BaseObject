//
//  UIView+Catrgory.m
//  JobProject
//
//  Created by CoDancer on 16/12/14.
//  Copyright © 2016年 CoDancer. All rights reserved.
//

#import "UIView+Catrgory.h"
#import <objc/runtime.h>
static char tapKey;

@implementation UIView (Catrgory)

#pragma mark - Metric properties

- (CGFloat)leftX
{
    return self.frame.origin.x;
}
- (void)setLeftX:(CGFloat)leftX
{
    self.frame = CGRectMake(leftX, self.frame.origin.y, self.bounds.size.width, self.bounds.size.height);
}

- (CGFloat)centerX
{
    return self.center.x;
}
- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)rightX
{
    return self.frame.origin.x + self.bounds.size.width;
}
- (void)setRightX:(CGFloat)rightX
{
    self.frame = CGRectMake(rightX-self.bounds.size.width, self.frame.origin.y, self.bounds.size.width, self.bounds.size.height);
}


- (CGFloat)topY
{
    return self.frame.origin.y;
}
- (void)setTopY:(CGFloat)topY
{
    self.frame = CGRectMake(self.frame.origin.x, topY, self.bounds.size.width, self.bounds.size.height);
}

- (CGFloat)centerY
{
    return self.center.y;
}
- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)bottomY
{
    return self.frame.origin.y + self.bounds.size.height;
}
- (void)setBottomY:(CGFloat)bottomY
{
    self.frame = CGRectMake(self.frame.origin.x, bottomY-self.bounds.size.height, self.bounds.size.width, self.bounds.size.height);
}

- (CGFloat)width
{
    return self.bounds.size.width;
}

- (void)setWidth:(CGFloat)width
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.bounds.size.height);
}

- (CGFloat)height
{
    return self.bounds.size.height;
}
- (void)setHeight:(CGFloat)height
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.bounds.size.width, height);
}


- (CGPoint)origin
{
    return self.frame.origin;
}
- (void)setOrigin:(CGPoint)origin
{
    self.frame = CGRectMake(origin.x, origin.y, self.bounds.size.width, self.bounds.size.height);
}

- (CGSize)size
{
    return self.bounds.size;
}
- (void)setSize:(CGSize)size
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height);
}

-(void)addShadow
{
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowRadius = 3;
    self.layer.shadowOffset = CGSizeMake(1, 1);
}

@end
