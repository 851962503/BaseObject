//
//  MPCBaseVC.m
//  LoanWorld
//
//  Created by mopucheng on 2018/7/17.
//  Copyright © 2018年 东哥. All rights reserved.
//

#import "MPCBaseVC.h"

@interface MPCBaseVC ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) MPCBaseNavView *customNaviView;
@property (nonatomic, assign) BOOL isCanSideBack;
@end

@implementation MPCBaseVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor colorWithR:238 G:238 B:238];
    [self.view addSubview:self.customNaviView];
}

- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    self.customNaviView.size = CGSizeMake(kScreenWidth, NAVHEIGHT);
    self.customNaviView.topY = 0;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [self resetSideBack];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self forbiddenSideBack];
    
}

- (MPCBaseNavView *)customNaviView {
    
    if (!_customNaviView) {
        _customNaviView = [MPCBaseNavView new];
        _customNaviView.layer.zPosition = 1.0;
        __weak typeof(self) weakSelf = self;
        _customNaviView.actionBlock = ^(BOOL isLeftBtn) {
            if (isLeftBtn) {
                [weakSelf leftBtnDidTouch];
            }else {
                [weakSelf rightBtnDidTouch];
            }
        };
    }
    return _customNaviView;
}

- (void)leftBtnDidTouch {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBtnDidTouch {
    
}

- (void)backBlcokIfNeed {
    
}

- (void)hideLeftBtn {
    
    [self.customNaviView hideLeftBtn];
}

- (void)setTitleText:(NSString *)titleText {
    
    _titleText = titleText;
    self.customNaviView.title = titleText;
}

- (void)setTitleImg:(UIImage *)titleImg {
    
    _titleImg = titleImg;
    self.customNaviView.titleImg = titleImg;
}

- (void)setRightImg:(UIImage *)rightImg {
    
    _rightImg = rightImg;
    self.customNaviView.rightImg = rightImg;
}

-(void)setBackColor:(UIColor *)backColor
{
    _backColor = backColor;
    self.customNaviView.backColor = backColor;
}

- (void)setRightBtnTitle:(NSString *)rightBtnTitle {
    
    _rightBtnTitle = rightBtnTitle;
    if ([_rightBtnTitle isEqualToString:@""]) {
        self.customNaviView.rightBtn.hidden = YES;
    }
    self.customNaviView.rightTitle = rightBtnTitle;
}

- (void)setShowLine:(BOOL)showLine {
    
    _showLine = showLine;
    self.customNaviView.showLine = showLine;
}

-(void)setIsShopCaterZero:(BOOL)isShopCaterZero
{
    _isShopCaterZero = isShopCaterZero;
    self.customNaviView.isShopCaterZero = isShopCaterZero;
}

-(void)setIsHiddenNav:(BOOL)isHiddenNav
{
    _isHiddenNav = isHiddenNav;
    if (isHiddenNav) {
        self.customNaviView.hidden = YES;
    }
}

-(void)setLeftBtnTitle:(NSString *)leftBtnTitle
{
    _leftBtnTitle = leftBtnTitle;
    self.customNaviView.leftBtnTitle = leftBtnTitle;
}

- (void)setLeftImg:(UIImage *)leftImg {
    
    _leftImg = leftImg;
    self.customNaviView.leftImg = leftImg;
}

- (void)setRightFont:(UIFont *)rightFont {
    
    _rightFont = rightFont;
    self.customNaviView.rightFont = rightFont;
}

-(void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    self.customNaviView.textColor = textColor;
}


- (UIView *)getBottomView {
    
    return self.customNaviView.bottomView;
}

- (UIButton *)getLeftBtn {
    
    return [self.customNaviView getLeftBtn];
}

- (UIButton *)getRightBtn {
    
    return [self.customNaviView getRightBtn];
}

- (UIImageView *)getTitleIV {
    
    return [self.customNaviView getTitleIV];
}

- (UIView *)baseNaviView {
    
    return self.customNaviView;
}

- (void)forbiddenSideBack {
    
    self.isCanSideBack = NO;
    //关闭ios右滑返回
    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}

- (void)resetSideBack {
    
    self.isCanSideBack=YES;
    //开启ios右滑返回
    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
    
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer*)gestureRecognizer {
    
    return self.isCanSideBack;
}

- (void)dealloc {
    
    NSLog(@"%s dealloc",object_getClassName(self));
    [self backBlcokIfNeed];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


@interface MPCBaseNavView()

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIImageView *titleIV;
@property (nonatomic, assign) CGFloat leftBtnX;

@end

@implementation MPCBaseNavView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.userInteractionEnabled = YES;
        [self addSubview:self.bottomView];
        [self addSubview:self.leftBtn];
        [self addSubview:self.titleLabel];
        [self addSubview:self.rightBtn];
        [self addSubview:self.lineView];
        self.leftBtnX = 0;
        
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.bottomView.frame = self.bounds;
    
    self.leftBtn.size = CGSizeMake(40, 44);
    self.leftBtn.leftX = 0;
    self.leftBtn.bottomY = self.height;
    
    [self.titleLabel sizeToFit];
    self.titleLabel.centerX = self.width/2.0;
    self.titleLabel.centerY = self.leftBtn.centerY;

    [self.titleIV sizeToFit];
    self.titleIV.centerX = self.width/2.0;
    self.titleIV.centerY = self.leftBtn.centerY;
    
    [self.rightBtn sizeToFit];
    self.rightBtn.rightX = self.width - 10;
    self.rightBtn.centerY = self.titleLabel.centerY;
    
    self.lineView.size = CGSizeMake(self.width, 0.5);
    self.lineView.bottomY = self.height;
}

- (UIView *)bottomView {
    
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = [UIColor clearColor];
    }
    return _bottomView;
}

- (UIImageView *)titleIV {
    
    if (!_titleIV) {
        _titleIV = [UIImageView new];
        _titleIV.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _titleIV;
}

- (UIButton *)leftBtn {
    
    if (!_leftBtn) {
        _leftBtn = [UIButton new];
        [_leftBtn setImage:[UIImage imageNamed:@"nav_back_normal_21x21"] forState:UIControlStateNormal];
        _leftBtn.imageView.contentMode = UIViewContentModeRedraw;
        [_leftBtn addTarget:self
                     action:@selector(popVC)
           forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont boldSystemFontOfSize:17.f];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UIButton *)rightBtn {
    
    if (!_rightBtn) {
        _rightBtn = [UIButton new];
        [_rightBtn addTarget:self
                      action:@selector(rightBtnDidTouch)
            forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}

- (UIView *)lineView {
    
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor colorWithHex:@"#E4E5E6"];
    }
    return _lineView;
}

- (void)popVC {
    
    if (self.actionBlock) {
        self.actionBlock(YES);
    }
}

- (void)rightBtnDidTouch {
    
    if (self.actionBlock) {
        self.actionBlock(NO);
    }
}

- (void)setTitle:(NSString *)title {
    
    _title = title;
    self.titleLabel.text = title;
    [self setNeedsLayout];
}

-(void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    self.titleLabel.textColor = textColor;
}

- (void)setTitleImg:(UIImage *)titleImg {
    
    _titleImg = titleImg;
    self.titleIV.image = titleImg;
}

-(void)setBackColor:(UIColor *)backColor
{
    self.backgroundColor = backColor;
}

- (void)setRightTitle:(NSString *)rightTitle {
    
    _rightTitle = rightTitle;
    self.rightBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.rightBtn setTitle:rightTitle forState:UIControlStateNormal];
    [self.rightBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self setNeedsLayout];
}

-(void)setLeftBtnTitle:(NSString *)leftBtnTitle
{
    _leftBtnTitle = leftBtnTitle;
    self.leftBtnX = 13;
    self.leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.leftBtn setTitle:leftBtnTitle forState:UIControlStateNormal];
    [self.leftBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self setNeedsLayout];
}

- (void)setShowLine:(BOOL)showLine {
    
    _showLine = showLine;
}

- (void)setRightImg:(UIImage *)rightImg {
    
    _rightImg = rightImg;
    [self.rightBtn setImage:rightImg forState:UIControlStateNormal];
}

-(void)setLeftImg:(UIImage *)leftImg
{
    _leftImg = leftImg;
    [self.leftBtn setImage:leftImg forState:UIControlStateNormal];
}

- (void)hideLeftBtn {
    
    self.leftBtn.hidden = YES;
}


- (UIButton *)getLeftBtn {
    
    return self.leftBtn;
}

- (UIButton *)getRightBtn {
    
    return self.rightBtn;
}

- (UIImageView *)getTitleIV {
    
    return self.titleIV;
}

- (void)setRightFont:(UIFont *)rightFont {
    
    _rightFont = rightFont;
    self.rightBtn.titleLabel.font = rightFont;
    [self.rightBtn sizeToFit];
    self.rightBtn.rightX = kScreenWidth - 10;
}

@end
