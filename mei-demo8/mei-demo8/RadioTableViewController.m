//
//  RadioTableViewController.m
//  mei-demo8
//
//  Created by 徐彦军 on 2019/11/12.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import "RadioTableViewController.h"

@interface RadioTableViewController ()
@property (nonatomic, strong) NSMutableArray *radioListArray;
@property (nonatomic, strong) NSMutableArray *radioEnglishArray;
- (IBAction)refresh:(id)sender;
@end

@implementation RadioTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    self.radioListArray = @[@"CRI杯旧金典", @"CRI轻松调频",
//                            @"CRI新闻广播", @"CRI劲歌FM 88.7"];
//    self.radioEnglishArray = @[@"CRI Oldies Online", @"CRI Easy FM",
//                               @"CRI News Radio", @"CRI HIT FM88.7"];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"radioData" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSLog(@"%@", dict);
    self.radioListArray = [NSMutableArray arrayWithArray:[dict objectForKey:@"mainTitle"]];
    self.radioEnglishArray = [NSMutableArray arrayWithArray:[dict objectForKey:@"subTitle"]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.radioListArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"radiolistcell" forIndexPath:indexPath];
////    cell.textLabel.text = [self.radioListArray objectAtIndex:indexPath.row];
//    NSString *imgname = [NSString stringWithFormat:@"other/pic%ld.png", indexPath.row];
////    cell.imageView.image = [UIImage imageNamed:imgname];
//    UIImageView *logoImageView = (UIImageView *) [cell viewWithTag:200];
//    logoImageView.image = [UIImage imageNamed:imgname];
//    UILabel *mainTitleLabel = (UILabel *) [cell viewWithTag:201];
//    mainTitleLabel.text = [self.radioListArray objectAtIndex:indexPath.row];
//    UILabel *subTitleLabel = (UILabel *) [cell viewWithTag:202];
//    subTitleLabel.text = [self.radioEnglishArray objectAtIndex:indexPath.row];
    
    RadioTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"radiolistcell" forIndexPath:indexPath];
    NSString *imgname = [NSString stringWithFormat:@"other/pic%ld.png", indexPath.row];
    cell.logoImageView.image = [UIImage imageNamed:imgname];
    cell.mainTitleLabel.text = [self.radioListArray objectAtIndex:indexPath.row];
    cell.subTitleLabel.text = [self.radioEnglishArray objectAtIndex:indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.radioListArray removeObjectAtIndex:indexPath.row];
        [self.radioEnglishArray removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];

        [tableView reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *radioName = [self.radioListArray objectAtIndex:indexPath.row];
    NSString *alertMsg = [NSString stringWithFormat:@"你已经选择了：%@", radioName];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"选择某行后提示框"
                                   message:alertMsg
                                   preferredStyle:UIAlertControllerStyleAlert];
     
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }];
     
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)refresh:(id)sender {
    [self.refreshControl beginRefreshing];
    DELAY(2000);
    dispatch_queue_t otherQ = dispatch_queue_create("Q", NULL);
    dispatch_async(otherQ, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.refreshControl endRefreshing];
        });
    });
    
    
    
}
@end
