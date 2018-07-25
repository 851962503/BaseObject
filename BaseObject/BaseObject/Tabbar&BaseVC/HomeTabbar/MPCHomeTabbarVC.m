//
//  MPCHomeTabbarVC.m
//  BaseObject
//
//  Created by mopucheng on 2018/7/25.
//  Copyright © 2018年 mopucheng. All rights reserved.
//

#import "MPCHomeTabbarVC.h"
#import "MPCHomeTableItem.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "RTNavigationController.h"
@interface MPCHomeTabbarVC ()
@property (nonatomic, assign)NSInteger isSelect;
@end

@implementation MPCHomeTabbarVC

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CycleTimer" object:nil];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建视图控制器数组
    [self creatViewController];
    
}

-(void)creatViewController
{
    // 主界面
    NSMutableArray *viewControllers = [NSMutableArray array];
    //获取本地tabbar源数据
    NSArray *listArray = @[];
    
    [viewControllers addObject:[[ViewController1 alloc]init]];
    [viewControllers addObject:[[ViewController2 alloc]init]];
    [viewControllers addObject:[[ViewController3 alloc]init]];
    
    
    NSMutableArray  *navArray = [NSMutableArray array];
    
    for (UIViewController *viewCtr in viewControllers) {
        RTNavigationController *nav = [[RTNavigationController alloc]initWithRootViewController:viewCtr];
        nav.delegate = self;
        [nav setNavigationBarHidden:YES];
        //        self.tabBar.hidden = YES;
        [navArray addObject:nav];
    }

    // 添加tabbar试图控制器
    [self setViewControllers:navArray];
    
    [self initTabbar:listArray];
}

//创建标签工具类
- (void)initTabbar:(NSArray *)listArray {
    
    //1.移除自带的tabbar工具类
    self.tabBar.clipsToBounds = YES;
    self.hidesBottomBarWhenPushed = YES;
    if (_tabBarImageView) {
        [_tabBarImageView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [_tabBarImageView removeFromSuperview];
        _tabBarImageView = nil;
    }
    //2.创建自定义tabbar背景
    _tabBarImageView = [[UIImageView alloc] initWithFrame:self.tabBar.bounds];
    _tabBarImageView.userInteractionEnabled = YES;
    
    [_tabBarImageView setBackgroundColor:[UIColor colorWithR:246 G:246 B:246]];
    [self.tabBar addSubview:_tabBarImageView];
    
    //3.创建自定义tabbar上的按钮
    NSMutableArray *titleArray = [NSMutableArray arrayWithArray:@[@"视图1",@"视图2",@"视图3"]];//标题
    NSMutableArray *imageArray = [NSMutableArray array];//默认图
    NSMutableArray *selImageArray = [NSMutableArray array];//选中图
    //素材
    NSArray *imageStr = @[@"tabbar_icon_1",@"tabbar_icon_2",@"tabbar_icon_3"];
    NSArray *selImageStr = @[@"tabbar_icon_1_sel",@"tabbar_icon_2_sel",@"tabbar_icon_3_sel"];
    
    for (int i = 0;  i < titleArray.count; i++) {
        [imageArray addObject:[UIImage imageNamed:imageStr[i%imageStr.count]]];
        [selImageArray addObject:[UIImage imageNamed:selImageStr[i%selImageStr.count]]];
    }
    
    float width = kScreenWidth/titleArray.count;
    _isSelect = 0;
    for (int i=0; i<titleArray.count; i++) {
        
        UIImage *image = imageArray[i];
        UIImage *selImage = selImageArray[i];
        NSString *titleName = titleArray[i];
        CGRect frame = CGRectMake(width*i, 0, width, 64);
        MPCHomeTableItem *tabbarItem = [[MPCHomeTableItem alloc] initWithFrame:frame image:image selectImg:selImage title:titleName];
        tabbarItem.tag = i;
        [tabbarItem addTarget:self action:@selector(tabbarItemSelected:) forControlEvents:UIControlEventTouchUpInside];
        [_tabBarImageView addSubview:tabbarItem];
    }
    MPCHomeTableItem *tabImte = (MPCHomeTableItem *)_tabBarImageView.subviews[0];
    self.selectedViewController = self.viewControllers[0];
    [tabImte setIsSelect:YES];
}


//点击按钮切换视图
- (void)tabbarItemSelected:(MPCHomeTableItem *)item {
    if (item.tag == _isSelect) {
        return;
    }
    self.selectedViewController = self.viewControllers[item.tag];
    MPCHomeTableItem *tabItem = (MPCHomeTableItem *)_tabBarImageView.subviews[_isSelect];
    [tabItem setTitleColor:[UIColor colorWithHex:@"#666666"]];
    [tabItem setIsSelect:NO];
    [item setIsSelect:YES];
    _isSelect = item.tag;
    [self hideTabbar:NO];
}

#pragma mark - UINavigationController delegte


//是否显示工具栏
- (void)hideTabbar:(BOOL)flag {
    if (flag) {
        self.tabBar.hidden =
        _tabBarImageView.hidden=YES;
    } else {
        self.tabBar.hidden =
        _tabBarImageView.hidden=NO;
    }
    //始终隐藏
    //    self.tabBar.hidden = YES;
}

-(void)hideTabBar:(BOOL)isHide{
    [self hideTabbar:isHide];
}


-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - <WCLHomeTabBarControllerDelegate, WCLAppCommendWebViewControllerDelegate>



@end
