//
//  ViewController.m
//  test-1
//
//  Created by 徐彦军 on 2019/11/14.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)login:(id)sender;
- (IBAction)register:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)login:(id)sender {
    NSString *name = self.username.text;
    NSString *pwd = self.password.text;
    
    NSLog(@"你输入的用户名：%@，你输入的密码：%@", name, pwd);
    [self.password resignFirstResponder];
}

- (IBAction)register:(id)sender {
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.password resignFirstResponder];
}
@end
