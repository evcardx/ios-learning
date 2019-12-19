//
//  ViewController.m
//  evcardh5-test
//
//  Created by 徐彦军 on 2019/11/18.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "ViewController.h"

@interface ViewController ()
- (IBAction)openEvcardH5:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *testStr = @"{\"a\":1,\"b\":\"\u4e2d\u56fd\"}";
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingUTF8);
    NSData *data = [testStr dataUsingEncoding:enc];
    NSString *rst = [[NSString alloc] initWithData:data encoding:enc];
    NSLog(@"RST: %@", rst);
    
}


- (IBAction)openEvcardH5:(id)sender {
    
}
@end
