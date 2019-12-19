//
//  ViewController.m
//  demi-demo7
//
//  Created by 徐彦军 on 2019/11/12.
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString: @"Segue_ID_AB"]) {
        SceneBViewController *sceneBVC = segue.destinationViewController;
        sceneBVC.delegate = self;
    }
}
- (void) toRecieve:(NSString *)inputText {
    NSLog(@"%@", inputText);
    self.showInformation.text = inputText;
}
@end
