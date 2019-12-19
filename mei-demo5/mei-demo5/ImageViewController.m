//
//  ImageViewController.m
//  mei-demo5
//
//  Created by 徐彦军 on 2019/11/11.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController () <UIScrollViewDelegate>

@end

@implementation ImageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    if(!_imageView) {
//        _imageView = [[UIImageView alloc] init];
//    }
//    self.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.imageURL]];
//    [self.imageView sizeToFit];
//    [self.view addSubview: self.imageView];
    [self.scrollView addSubview: self.imageView];
}

-(void) setImageURL:(NSURL *)imageURL {
    _imageURL = imageURL;
    [self.spinner startAnimating];
    self.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.imageURL]];
}
-(void) startDownloadingImage {
    self.image = nil;
    if(self.imageURL) {
        NSURLRequest *request = [NSURLRequest requestWithURL: self.imageURL];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration: configuration];
        NSURLSessionDownloadTask *task = [session downloadTaskWithRequest: request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if(!error) {
                if([request.URL isEqual:self.imageURL]) {
//                    UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL:localfile]];
                }
            }
        }];
    }
    
}
-(void) setImage:(UIImage *)image {
    self.imageView.image = image;
    [self.imageView sizeToFit];
}
-(UIImageView *) imageView {
    if(!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}
-(UIImage *) image {
    return self.imageView.image;
}
-(void) setScrollView:(UIScrollView *)scrollView {
    _scrollView = scrollView;
    _scrollView.minimumZoomScale = 0.2;
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.delegate = self;
    self.scrollView.contentSize = self.image.size;
}
-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}
@end
