//
//  htmlViewController.m
//  evcardh5-native-demo
//
//  Created by 徐彦军 on 2019/11/19.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import "htmlViewController.h"

@interface htmlViewController ()
@property (strong, nonatomic) UIImagePickerController *imagePicker;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSMutableDictionary *urlData;
@end

@implementation htmlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 隐藏导航条
//    self.navigationController.delegate = self;
//    [self.navigationController.navigationBar setHidden:YES];
//    [self.navigationController setNavigationBarHidden:YES];
    // 打开H5
    [self openEvcardH5];
    
}

- (void)openEvcardH5 {
    WKWebViewConfiguration *conf = [[WKWebViewConfiguration alloc] init];
    conf.preferences =[[WKPreferences alloc] init];
    conf.preferences.minimumFontSize = 10;
    conf.preferences.javaScriptEnabled = YES;
    conf.userContentController = [[WKUserContentController alloc] init];
    conf.processPool = [[WKProcessPool alloc] init];
    
    // 初始化
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
//    self.url = @"http://10.2.53.170:8083";
    self.url = @"http://csms-st.evcard.vip:180/evcard-h5app/#/?appKey=nanjing";
//    self.url = @"http://10.2.53.170:8083/";
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 200, width, height - 200) configuration:conf];
    self.webView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    
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
- (void)initPickerController {
    //创建拾取控制器
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    //设置拾取源为摄像头
    pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    //设置摄像头为后置
    pickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    pickerController.delegate = self;//设置代理
    self.imagePicker = pickerController;
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

- (void)handleCustomAction: (NSURL *) URL {
    if (!self.urlData) {
        self.urlData = [[NSMutableDictionary alloc]init];
    }
    // 传入url创建url组件类
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:URL.absoluteString];
    // 回调遍历所有参数，添加入字典
    // 因为args是经过encodeURIComponent(args)的，所以要先转码, 此方法默认进行decode操作了
    [urlComponents.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.urlData setObject:obj.value forKey:obj.name];
    }];
    NSLog(@"%@", self.urlData);
    NSString *method = self.urlData[@"method"];
    // 返回操作，此种场景一般不用执行回调
    if ([method isEqualToString:@"goback"]) {
        [self goBack];
    }
    // 获取用户登录信息
    if ([method isEqualToString:@"getuserinfo"]) {
        [self getUserInfo:self.urlData];
    }
    // 拍照片
    if ([method isEqualToString:@"chooseimage"]) {
        [self chooseImage:self.urlData];
    }
    // 拍视频
    if ([method isEqualToString:@"choosevideo"]) {
        [self chooseVideo];
    }
    
}
// H5返回App操作
- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
}
// 获取用户登录信息
- (void)getUserInfo:(NSMutableDictionary *)params {
    // 用户信息
    NSDictionary *userInfo = @{@"phone": @"18506170101", @"token": @"sldflsdjfadsjfldewekrjewlr"};
    // 原生调用js
//    NSString *jsScript = [NSString stringWithFormat:@"EvApp.callback(%@,\"{\"phone\":\"%@\",\"token\":\"%@\"})", params[@"callbackId"], userInfo[@"phone"], userInfo[@"token"]];
    NSString *jsScript = [NSString stringWithFormat:@"EvApp.callback(%@,{phone:'%@',token:'%@'})", params[@"callbackId"], userInfo[@"phone"], userInfo[@"token"]];
    NSLog(@"JS--: %@", jsScript);
    [self.webView evaluateJavaScript:jsScript completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        NSLog(@"%@", result);
    }];
}
// 拍照片，
- (void)chooseImage:(NSMutableDictionary *)params {
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary]) {
        [self presentViewController:self.imagePicker animated:YES completion:nil];
    }
}
// 拍视频
- (void)chooseVideo {
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        // 使用前置摄像头
        self.imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        // 录制的类型，为视频
        self.imagePicker.mediaTypes = @[(NSString*)kUTTypeMovie];
        // 录制的时长
        self.imagePicker.videoMaximumDuration = 5.0;
//        self.imagePicker.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:self.imagePicker animated:YES completion:nil];
    }
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    // 处理图片
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        self.imageView.image = originalImage;
        
        NSData *imageData = UIImageJPEGRepresentation(originalImage, 0.4);
        NSString *dataStr = [imageData base64EncodedStringWithOptions:0];
        
        NSString *jsScript = [NSString stringWithFormat:@"EvApp.callback(%@,{imageBase64:'%@'})", self.urlData[@"callbackId"], dataStr];
        
        [self.webView evaluateJavaScript:jsScript completionHandler:^(id _Nullable result, NSError * _Nullable error) {
            NSLog(@"%@", result);
        }];
    }
    // 处理视频
    if ([mediaType isEqualToString:(NSString *)kUTTypeMovie]) {
        //获取录像文件路径URL
        NSURL *url = [info objectForKey:UIImagePickerControllerMediaURL];
        NSURL *url2 = [info objectForKey:UIImagePickerControllerPHAsset];
//        NSString *path = url.path;
        NSLog(@"视频地址：%@", url2);
//        NSFileManager
//        NSFileManager* fm = [NSFileManager defaultManager];
//        NSString *tmpPath = [NSString stringWithFormat:@"%@/tmp/video%.0f.merge.mp4", NSHomeDirectory(), [NSDate timeIntervalSinceReferenceDate] * 1000];
//        NSLog(@"tmpPath: %@", tmpPath);
//        NSURL *mergeFileURL = [NSURL fileURLWithPath:tmpPath];
        
        //通过文件管理器将视频存放的创建的路径中
//        [fm copyItemAtURL:[info objectForKey:UIImagePickerControllerMediaURL] toURL:mergeFileURL error:nil];
//        //判断能不能保存到相簿
//        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(path)) {
//            //保存视频到相簿
//            UISaveVideoAtPathToSavedPhotosAlbum(path, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
//        }
    }
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];

}
//保存视频完成之后的回调
- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error) {
        NSLog(@"保存视频失败%@", error.localizedDescription);
    }
    else {
        NSLog(@"保存视频成功");
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
