//
//  ViewController.h
//  mei-demo8
//
//  Created by 徐彦军 on 2019/11/12.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *radioListArray;
@end

