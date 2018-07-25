//
//  MPCHomeTableItem.m
//  BaseObject
//
//  Created by mopucheng on 2018/7/25.
//  Copyright © 2018年 mopucheng. All rights reserved.
//

#import "MPCHomeTableItem.h"

@implementation MPCHomeTableItem{
    UILabel       *_pageLabel;
    UIView        *_ntcView;
}


- (id)initWithFrame:(CGRect)frame imageName:(NSString *)imgStr selectImg:(NSString *)selectImg title:(NSString *)title {
    self = [super initWithFrame:frame];
    if (self != nil) {
        
        self.imgStr = [UIImage imageNamed:imgStr];
        self.selectImg = [UIImage imageNamed:selectImg];
        float h = 0.5;
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, h)];
        line.backgroundColor = [UIColor colorWithHex:@"#D6D6D6"];
        [self addSubview:line];
        CGPoint center = CGPointMake(CGRectGetWidth(frame)/2, 28/2+4);
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 28, 28)];
        _imageView.center = center;
        //让图片不拉伸，在imageView居中显示
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.image = [UIImage imageNamed:imgStr];
        [self addSubview:_imageView];
        
        
        _pageLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_imageView.frame)-7, 2,  0, 16)];
        _pageLabel.backgroundColor = [UIColor colorWithHex:@"#FFBC5D"];
        _pageLabel.layer.cornerRadius = 8;
        _pageLabel.layer. borderWidth = 2.5f;
        _pageLabel.layer.borderColor = [UIColor colorWithHex:@"#FFBC5D"].CGColor;
        
        _pageLabel.layer.masksToBounds = YES;
        _pageLabel.text = @"0";
        _pageLabel.font = [UIFont systemFontOfSize:10];
        _pageLabel.textAlignment = NSTextAlignmentCenter;
        _pageLabel.textColor = [UIColor colorWithHex:@"#ffffff"];
        _pageLabel.hidden = YES;
        [self addSubview:_pageLabel];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_imageView.frame), self.frame.size.width, 13)];
        _titleLabel.text = title;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor colorWithHex:@"#666666"];
        _titleLabel.font = [UIFont systemFontOfSize:11];
        [self addSubview:_titleLabel];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)img selectImg:(UIImage *)selectImg title:(NSString *)title {
    if (self = [super initWithFrame:frame]) {
        self.imgStr = img;
        self.selectImg = selectImg;
        float h = 0.5;
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, h)];
        line.backgroundColor = [UIColor blackColor];//HexRGB(0xCCCCCC);
        line.alpha = 0.15;
        [self addSubview:line];
        CGPoint center = CGPointMake(((int)CGRectGetWidth(frame))/2, 28/2+3);
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 28, 28)];
        _imageView.center = center;
        
        //让图片不拉伸，在imageView居中显示
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.image = img;
        [self addSubview:_imageView];
        _pageLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_imageView.frame)-7, 2,  0, 16)];
        _pageLabel.backgroundColor = [UIColor colorWithHex:@"#FFBC5D"];
        _pageLabel.layer.cornerRadius = 8;
        _pageLabel.layer.borderWidth = 2.5f;
        _pageLabel.layer.borderColor = [UIColor colorWithHex:@"#FFBC5D"].CGColor;
        
        _pageLabel.layer.masksToBounds = YES;
        _pageLabel.text = @"0";
        _pageLabel.font = [UIFont systemFontOfSize:10];
        _pageLabel.textAlignment = NSTextAlignmentCenter;
        _pageLabel.textColor = [UIColor colorWithHex:@"#ffffff"];
        _pageLabel.hidden = YES;
        [self addSubview:_pageLabel];
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_imageView.frame), self.frame.size.width, 13)];
        _titleLabel.text = title;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor colorWithHex:@"#666666"];
        _titleLabel.font = [UIFont systemFontOfSize:11];
        [self addSubview:_titleLabel];
    }
    
    return self;
}

- (void)setIsSelect:(BOOL)isSelect {
        _isSelect = isSelect;
        [self isShow:isSelect];
}

- (void)isShow:(BOOL)select {
    if (select) {
        //self.backgroundColor=[UIColor blackColor];
        [_imageView setImage:_selectImg];
        _titleLabel.textColor = [UIColor colorWithHex:@"#EC414D"];
        
    } else {
        self.backgroundColor=[UIColor clearColor];
        [_imageView setImage:_imgStr];
        _titleLabel.textColor = [UIColor colorWithHex:@"#666666"];
    }
}

-(void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    _titleLabel.textColor = _titleColor;
}

-(void)setNotificationMessageHidden:(BOOL)notificationMessageHidden
{
    _notificationMessageHidden = notificationMessageHidden;
    
    __weak typeof(self) weakSelf = self;
    if (notificationMessageHidden)  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_ntcView removeFromSuperview];
    });
}


@end
