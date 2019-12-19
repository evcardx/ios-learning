//
//  ViewController.m
//  tomcat
//
//  Created by 徐彦军 on 2019/11/23.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *img;

- (IBAction)drink:(id)sender;
- (IBAction)fart:(id)sender;

@property (strong, nonatomic) NSMutableArray *imgArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imgArr = [NSMutableArray array];
    
}


- (IBAction)drink:(id)sender {
    [self.imgArr removeAllObjects];
    for(int i = 1; i <= 80; i++) {
        NSString *imgName = [NSString stringWithFormat:@"drink_%02d", i];
//        NSLog(@"%@", imgName);
        UIImage *img = [UIImage imageNamed:imgName];
        [self.imgArr addObject:img];
    }
    self.img.animationImages = self.imgArr;
    self.img.animationRepeatCount = 1;
    self.img.animationDuration = self.imgArr.count * 0.075;
    [self.img startAnimating];
}

- (IBAction)fart:(id)sender {
}
@end
