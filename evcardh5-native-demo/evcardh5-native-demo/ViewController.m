//
//  ViewController.m
//  evcardh5-native-demo
//
//  Created by 徐彦军 on 2019/11/19.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)openH5:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self login];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toH5"]) {
        NSLog(@"");
    }
}

- (void)login {
    NSURL *url = [NSURL URLWithString:@"http://10.2.53.170:7001/thirdapp/api/testEcho"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[@"name=jack&password=123" dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *firstTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Get请求返回的响应信息：%@",[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
    }];
    [firstTask resume];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


//- (IBAction)login:(id)sender {
////    [self.checkCode resignFirstResponder];
//
//    // 打开EVCARD H5页面
//    [self performSegueWithIdentifier: @"toH5" sender: nil];
//}

- (IBAction)openH5:(id)sender {
    [self performSegueWithIdentifier:@"toH5" sender:nil];
}
@end
