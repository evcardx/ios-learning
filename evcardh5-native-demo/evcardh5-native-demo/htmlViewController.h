//
//  htmlViewController.h
//  evcardh5-native-demo
//
//  Created by 徐彦军 on 2019/11/19.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

NS_ASSUME_NONNULL_BEGIN

@interface htmlViewController : UIViewController<WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) CALayer *progresslayer;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) WKWebView *webView;
@end
NS_ASSUME_NONNULL_END
