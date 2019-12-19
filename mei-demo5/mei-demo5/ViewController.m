//
//  ViewController.m
//  mei-demo5
//
//  Created by 徐彦军 on 2019/11/11.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.destinationViewController isKindOfClass: [ImageViewController class]]) {
        // 获取目标视图控制器
        ImageViewController *ivc = (ImageViewController *) segue.destinationViewController;
        // 根据Segue Identifier判断将哪个图片名称传给SceneB
//        ivc.imageName = [NSString stringWithFormat: @"%@.jpg", segue.identifier];
//        ivc.title = segue.identifier;
        if([segue.identifier isEqualToString:@"image_1"]) {
            ivc.imageURL = [NSURL URLWithString:@"https://evcard-h5.oss-cn-shanghai.aliyuncs.com/kuavfyvva11571989660026.png"];
        } else if([segue.identifier isEqualToString:@"image_2"]) {
            ivc.imageURL = [NSURL URLWithString:@"https://evcard-h5.oss-cn-shanghai.aliyuncs.com/clacsymp51e1571984170740.png"];
        } else {
            ivc.imageURL = [NSURL URLWithString:@"https://evcard-h5.oss-cn-shanghai.aliyuncs.com/v3b6id45f5i1567668504822.png"];
        }
    }
}

@end
