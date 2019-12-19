//
//  ViewController.m
//  mei-demo2
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
}


- (IBAction)buttonClicked:(UIButton *)sender {
    self.textLabel.text = @"按钮被点击了， 顶过";
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"");
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)buttonClick:(id)sender {
    self.clickCout++;
//    self.textLabel.text = [NSString stringWithFormat: @"button clicked counter is: %ld", self.clickCout];
}
-(void) setClickCout:(int)clickCout
{
    _clickCout = clickCout;
    self.textLabel.text = [NSString stringWithFormat: @"button clicked counter is: %d", self.clickCout];
}
@end
