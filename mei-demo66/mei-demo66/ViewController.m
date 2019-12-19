//
//  ViewController.m
//  mei-demo66
//
//  Created by 徐彦军 on 2019/11/11.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import "ViewController.h"
#import "SceneBViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"场景跳转"
                                   message:@"是否跳转到下一个页面"
                                   preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {
        NSLog(@"点击ok");
        [self performSegueWithIdentifier: @"toSceneA" sender: nil];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了取消按钮");
        SceneBViewController *destB = [self.storyboard instantiateViewControllerWithIdentifier: @"SceneB"];
        // 设置过渡样式和显示样式
        destB.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        destB.modalPresentationStyle = UIModalPresentationFormSheet;
        // 显示B
        [self presentViewController:destB animated:YES completion:nil];
    }];

    [alert addAction:defaultAction];
    [alert addAction:cancel];

    [self presentViewController:alert animated:YES completion:nil];
}

-(IBAction)unwindViewController:(UIStoryboardSegue *)segue
{
    NSLog(@"unwind segue is exected");
}

@end
