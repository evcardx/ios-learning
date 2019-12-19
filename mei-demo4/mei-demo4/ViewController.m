//
//  ViewController.m
//  mei-demo4
//
//  Created by 徐彦军 on 2019/11/9.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 设定UILable的原点、高度、宽度
    CGRect labelRect = CGRectMake(120, 240, 200, 100);
    // 创建一个label对象并初始化
    UILabel *label = [[UILabel alloc] initWithFrame: labelRect];
    // 设置m内容
    label.text = @"创建的Label";
    // 将label添加到视图中
    [self.view addSubview: label];
//    label.hidden = YES;
    CGRect scrollRect = CGRectMake(0, 0, 200, 100);
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame: scrollRect];
    
    
    
    NSArray *images = @[@"1.png", @"2.png", @"3.png", @"4.png"];
    
    for(int i = 0; i < [images count]; i++) {
        // 创建UIImageView
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(320 * i, 0, 320, 480)];
        imageV.contentMode = UIViewContentModeScaleAspectFit;
        NSString *filename = [NSString stringWithFormat:@"%d.png", i];
        UIImage *image = [UIImage imageNamed: filename];
        imageV.image = image;
        
        [scrollView addSubview: imageV];
    }
    [self.view addSubview: scrollView];
//    scrollView.contentSize = CGMakeSize(320 * [images count], 480);
    
}

-(void) viewDidAppear:(BOOL)animated {
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"My Alert"
//                                   message:@"This is an alert."
//                                   preferredStyle:UIAlertControllerStyleAlert];
//
//    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
//       handler:^(UIAlertAction * action) {
//        NSLog(@"点击ok");
//    }];
//    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//            NSLog(@"点击了取消按钮");
//        }];
//
//    [alert addAction:defaultAction];
//    [alert addAction:cancel];
//
//    [self presentViewController:alert animated:YES completion:nil];
}

@end
