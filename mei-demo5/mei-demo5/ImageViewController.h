//
//  ImageViewController.h
//  mei-demo5
//
//  Created by 徐彦军 on 2019/11/11.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageViewController : UIViewController

@property (nonatomic, strong) NSString *imageName;
@property (strong, nonatomic) UIImageView *imageView;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSURL *imageURL;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

NS_ASSUME_NONNULL_END
