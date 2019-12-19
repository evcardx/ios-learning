//
//  ViewController.h
//  mei-demo2
//
//  Created by 徐彦军 on 2019/11/9.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic) int clickCout;

- (IBAction)buttonClicked:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

- (IBAction)didEndOnExit:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UIButton *buttonText;
- (IBAction)buttonClick:(id)sender;

@end

