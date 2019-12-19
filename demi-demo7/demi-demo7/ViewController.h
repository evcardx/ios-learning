//
//  ViewController.h
//  demi-demo7
//
//  Created by 徐彦军 on 2019/11/12.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SceneBViewController.h"

@interface ViewController : UIViewController<SceneBViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *showInformation;
@property (weak, nonatomic) IBOutlet UITextField *testInput;

@end

