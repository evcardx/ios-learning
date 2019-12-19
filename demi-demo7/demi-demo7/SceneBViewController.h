//
//  SceneBViewController.h
//  demi-demo7
//
//  Created by 徐彦军 on 2019/11/12.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SceneBViewControllerDelegate <NSObject>

-(void) toRecieve: (NSString *) inputText;

@end

@interface SceneBViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *inputImformation;
@property (weak, nonatomic) id <SceneBViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
