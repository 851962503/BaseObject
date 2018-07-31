//
//  MPCWebVC.m
//  ring
//
//  Created by mopucheng on 2018/5/8.
//  Copyright © 2018年 xia. All rights reserved.
//

#import "MPCWebVC.h"
#import <WebKit/WebKit.h>
@interface MPCWebVC () <WKNavigationDelegate, WKUIDelegate>
@property (nonatomic, strong)WKWebView *webView;
@property (nonatomic, strong) UIProgressView *progressView;
@end

static NSString * const kWebViewEstimatedProgress = @"estimatedProgress";
@implementation MPCWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    [self creatProgressView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]]];
    [self.webView addObserver:self
                   forKeyPath:kWebViewEstimatedProgress
                      options:NSKeyValueObservingOptionNew
                      context:nil];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

-(void)backVC
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.webView.frame = self.view.bounds;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:17]};
    if (!self.isTabbar) {
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame = CGRectMake(0, 0.f, 55.f, 40.f);
        [backButton setImage:[[UIImage imageNamed:@"nav_back_gray_normal_15x21"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                    forState:UIControlStateNormal];
        backButton.imageView.contentMode = UIViewContentModeRedraw;
        backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [backButton addTarget:self action:@selector(backVC) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    }
}

- (void)creatProgressView {
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 88, CGRectGetWidth(self.view.frame), 20.f)];
    //    self.progressView.backgroundColor = [UIColor blueColor];
    self.progressView.trackTintColor = [UIColor clearColor];
    self.progressView.tintColor = [UIColor blueColor];
//    self.progressView.progress = 0.5;
//    self.progressView.progressImage = nil;
//    [self.view addSubview:self.progressView];
}

-(WKWebView *)webView
{
    if (!_webView) {
        WKWebViewConfiguration * config = [[WKWebViewConfiguration alloc]init];
        config.userContentController = [[WKUserContentController alloc]init];
        _webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:config];
        _webView.allowsBackForwardNavigationGestures = YES;
        _webView.navigationDelegate = self;
        _webView.UIDelegate = self;
    }
    return _webView;
}

-(void)setUrlStr:(NSString *)urlStr
{
    _urlStr = urlStr;
}

#pragma mark - KVO监听函数
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:kWebViewEstimatedProgress]){
        //estimatedProgress取值范围是0-1;
        //        self.progressView.progress = self.webView.estimatedProgress;
        [self.progressView setProgress:self.webView.estimatedProgress animated:YES];
    }
    
    if (!self.webView.loading) {
        [UIView animateWithDuration:0.5 animations:^{
            self.progressView.alpha = 0;
        }];
    }
    
}

//页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    if (!self.isTabbar) {
       self.title = webView.title;
    }
    self.progressView.alpha = 0;
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    NSURL *URL = navigationAction.request.URL;
    //    NSLog(@"========%@", URL.absoluteString);
    
    if (self.isTabbar && ![URL.absoluteString isEqualToString:@""] ) {
        MPCWebVC *webVC = [MPCWebVC new];
        webVC.urlStr = URL.absoluteString;
        [self.navigationController pushViewController:webVC animated:YES];
        decisionHandler(WKNavigationActionPolicyCancel);
        return;
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
