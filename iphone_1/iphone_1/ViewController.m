//
//  ViewController.m
//  iphone_1
//
//  Created by 徐彦军 on 2019/11/8.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize dispaly;

- (IBAction)click1:(id)sender {
    dispaly.text = @"1";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
