//
//  SceneBViewController.m
//  mei-demo66
//
//  Created by 徐彦军 on 2019/11/11.
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

-(IBAction)backToSceneA:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"unwind");
    }];
}
- (IBAction)backToScenea:(id)sender {
    NSLog(@"unwind1111");
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"unwind");
    }];
}

@end
