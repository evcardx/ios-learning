//
//  ViewController.m
//  mei-demo8
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
    self.radioListArray = @[@"CRI杯旧金典", @"CRI轻松调频",
                            @"CRI新闻广播", @"CRI劲歌FM 88.7"];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath { 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"radiocell" forIndexPath:indexPath];
    cell.textLabel.text = [self.radioListArray objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return [self.radioListArray count];
}

@end
