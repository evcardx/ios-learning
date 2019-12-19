//
//  SceneBViewController.m
//  demi-demo7
//
//  Created by 徐彦军 on 2019/11/12.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import "SceneBViewController.h"

@interface SceneBViewController ()

@end

@implementation SceneBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(self.delegate) {
        [self.delegate toRecieve: self.inputImformation.text];
        // 让当前d的页面消失
        [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
            NSLog(@"SceneB消失");
        }];
    }
    [textField resignFirstResponder];
    return YES;
}

@end
