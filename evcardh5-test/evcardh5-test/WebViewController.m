//
//  WebViewController.m
//  evcardh5-test
//
//  Created by 徐彦军 on 2019/11/18.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 1. 创建webview
//    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
//    // 2. 创建远程URL
//    NSURL *remoteURL = [NSURL URLWithString:@"https://developer.apple.com/reference/webkit"];
//    // 3. 创建Request
//    NSURLRequest *request = [NSURLRequest requestWithURL:remoteURL];
//    // 4. 加载网页
//    [webView loadRequest:request];
//    // 5.
//    [self.view addSubview:webView];
    [self openEvcardH5];
}

- (void) openEvcardH5 {
    WKWebViewConfiguration *conf = [[WKWebViewConfiguration alloc] init];
    conf.preferences =[[WKPreferences alloc] init];
    conf.preferences.minimumFontSize = 10;
    conf.preferences.javaScriptEnabled = YES;
    conf.userContentController = [[WKUserContentController alloc] init];
    conf.processPool = [[WKProcessPool alloc] init];
    
    // 初始化
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    self.url = @"http://10.2.53.170:8083";
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, width, height) configuration:conf];
    self.webView.backgroundColor = [UIColor whiteColor];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    
    [self.view addSubview:self.webView];
    
    self.progresslayer = [[CALayer alloc] init];
    self.progresslayer.frame = CGRectMake(0, 90, 20, 2);
    self.progresslayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:self.progresslayer];
    
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    // 添加js注入，js调用原生
    [conf.userContentController addScriptMessageHandler:self name:@"jsFunction"];
    // 打印html中log的信息
    [conf.userContentController addScriptMessageHandler:self name:@"log"];
    // 后台js调用
//    window.webkit.messageHandlers.jsFunction.postMessage({body: 'key=value'});
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSLog(@"message: %@", message.name);
    if ([message.name isEqualToString:@"log"]) {
        NSLog(@"Log: %@", message.body);
    }
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    // 接收后台传递数据
    // 原生调用js
//    NSString *js = [NSString stringWithFormat:@"sendKey('%@')", @"key"];
//    NSLog(@"message: %@", js);
//    [self.webView evaluateJavaScript:js completionHandler:^(id _Nullable result, NSError * _Nullable error) {
//        NSLog(@"%@", result);
//    }];
}
// 监听
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progresslayer.opacity = 1;
        float newValue = [[change objectForKey:@"new"] floatValue];
        CGFloat width = self.view.frame.size.width;
        self.progresslayer.frame = CGRectMake(0, 90, width * newValue, 2);
        if (newValue == 1) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.progresslayer.opacity = 0;
            });
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.progresslayer.frame = CGRectMake(0, 0, 0, 2);
            });
        }
        
    }
    if ([keyPath isEqualToString:@"title"]) {
        self.title = [change objectForKey:@"new"];
    }
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSURL *URL = navigationAction.request.URL;
    NSLog(@"URL: %@", URL);
    NSString *scheme = [URL scheme];
    NSLog(@"scheme: %@", scheme);
    // 如果是自定义的scheme，则进行拦截，取消跳转
    if ([scheme isEqualToString:@"evjs"]) {
        [self handleCustomAction: URL];
        decisionHandler(WKNavigationActionPolicyCancel);
        return;
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void) handleCustomAction: (NSURL *) URL {
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    // 传入url创建url组件类
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:URL.absoluteString];
    // 回调遍历所有参数，添加入字典
    // 因为args是经过encodeURIComponent(args)的，所以要先转码, 此方法默认进行decode操作了
    [urlComponents.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [params setObject:obj.value forKey:obj.name];
    }];
    NSLog(@"%@", params);
    NSString *method = params[@"method"];
    // 返回操作，此种场景一般不用执行回调
    if ([method isEqualToString:@"goback"]) {
        [self goBack];
    }
    // 获取用户登录信息
    if ([method isEqualToString:@"getuserinfo"]) {
        [self getUserInfo:params];
    }
    // 拍照片
    if ([method isEqualToString:@"chooseimage"]) {
        [self chooseImage:params];
    }
    
}
// H5返回App操作
- (void) goBack {
    [self.navigationController popViewControllerAnimated:YES];
}
// 获取用户登录信息
- (void) getUserInfo:(NSMutableDictionary *)params {
    // 用户信息
    NSDictionary *userInfo = @{@"phone": @"18506170101", @"token": @"sldflsdjfadsjfldewekrjewlr"};
    // 原生调用js
    NSString *jsScript = [NSString stringWithFormat:@"EvApp.callback(%@,{'phone':'%@','token':'%@'})", params[@"callbackId"], userInfo[@"phone"], userInfo[@"token"]];
    NSLog(@"JS--: %@", jsScript);
    [self.webView evaluateJavaScript:jsScript completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        NSLog(@"%@", result);
    }];
}
// 拍照片，
- (void) chooseImage:(NSMutableDictionary *)params {
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        //    imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        //    imagePicker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
        
        [self presentViewController:imagePicker animated:YES completion:nil];
        
    }
    
}
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提醒" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}


@end
