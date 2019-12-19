//
//  main.m
//  FractionTest
//
//  Created by 徐彦军 on 2019/11/7.
//  Copyright © 2019 徐彦军. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "Fraction.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Fraction *myFraction = [[Fraction alloc] init];
        Fraction *bFraction = [[Fraction alloc] init];
        
//        [myFraction setNumberator: 1];
//        [myFraction setDenominator: 3];
        myFraction.numberator = 1;
        myFraction.denominator = 3;
        
        [bFraction setTo: 2 over: 5];
        
        NSLog(@"The value of myFraction is: ");
        [myFraction print];
        [myFraction add: bFraction];
        [myFraction print];
//        NSLog(@"The value of myFraction is: %i/%i", [myFraction numberator], [myFraction denominator]);
//        NSLog(@"The value of myFraction is: %i/%i", myFraction.numberator, myFraction.denominator);
    }
    return 0;
}
