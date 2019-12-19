//
//  main.m
//  mei-demo
//
//  Created by 徐彦军 on 2019/11/9.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSUserDefaults *myUserDefaults = [NSUserDefaults standardUserDefaults];
        
        
        return 0;
        
        
        NSMutableArray *myMutableArray = [[NSMutableArray alloc] init];
        [myMutableArray addObject: [NSNumber numberWithInt: 100]];
        
        return 0;
        // insert code here...
//        NSLog(@"Hello, World!");
        NSString *strA = @"abc";
        NSString *strB = @"abc";
        
//        if (strA == strB) {
        if ([strA isEqualToString: strB]) {
            NSLog(@"A is equal B");
        } else {
            NSLog(@"A is not equal B");
        }
        
    }
    return 0;
}
