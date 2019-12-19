//
//  main.m
//  demo
//
//  Created by 徐彦军 on 2019/11/6.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Fraction : NSObject

-(void) print;
-(void) setNumberator: (int) n;
-(void) setDenominator: (int) d;
-(int) numberator;
-(int) denominator;

@end

@implementation Fraction
{
    int numberator;
    int denominator;
}
-(void) print
{
    NSLog(@"%i/%i", numberator, denominator);
}
-(void) setNumberator: (int) n
{
    numberator = n;
}
-(void) setDenominator: (int) d
{
    denominator = d;
}
-(int) numberator
{
    return numberator;
}
-(int) denominator{
    return denominator;
}
@end


@interface Calculator : NSObject
// 累加方法
-(void) setAccumulator: (double) value;
-(void) clear;
-(double) accumulator;

// 算法方法
-(void) add: (double) value;
-(void) subtract: (double) value;
-(void) multiply: (double) value;
-(void) divide: (double) value;

@end

@implementation Calculator
{
    double accumulator;
}
-(void) setAccumulator: (double) value
{
    accumulator = value;
}
-(void) clear
{
    accumulator = 0;
}
-(double) accumulator
{
    return accumulator;
}
-(void) add: (double) value
{
    accumulator += value;
}
-(void) subtract: (double) value
{
    accumulator -= value;
}
-(void) multiply: (double) value
{
    accumulator *= value;
}
-(void) divide: (double) value
{
    accumulator /= value;
}
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int number;
        NSLog(@"Type in your number: ");
        scanf("%i", &number);
        
        if (number < 0) {
            number = -number;
        }
        NSLog(@"The absolute value is %i", number);
//        Calculator *deskCalc = [[Calculator alloc] init];
//
//        [deskCalc setAccumulator: 100];
//        [deskCalc add: 200.];
//        [deskCalc divide: 15.0];
//        [deskCalc subtract: 10.0];
//        [deskCalc multiply: 5];
//
//        NSLog(@"The result is %g", [deskCalc accumulator]);
//        int integerVar = 100;
//        float floatingVar = 331.79;
//        double doubleVar = 8.44e+11;
//        char charVar = 'W';
//
//        NSLog(@"integerVar = %i", integerVar);
//        NSLog(@"floatingVar = %f", floatingVar);
//        NSLog(@"doubleVar = %e", doubleVar);
//        NSLog(@"doubleVar = %g", doubleVar);
//        NSLog(@"charVar = %c", charVar);
        
        
        
//        Fraction *myFraction;
//        myFraction = [Fraction alloc];
//        myFraction = [myFraction init];
//        Fraction *myFraction = [[Fraction alloc] init];
//        Fraction *myFraction = [Fraction new];
        
//        [myFraction setNumberator: 1];
//        [myFraction setDenominator: 3];
        
//        NSLog(@"The value of myFraction is: ");
//        [myFraction print];
//        NSLog(@"The value of myFraction is: %i/%i", [myFraction numberator], [myFraction denominator]);
//        int value1, value2, sum;
//        value1 = 50;
//        value2 = 25;
//        sum = 50 + 25;
        // insert code here...
//        NSLog(@"Hello, World!");
//        NSLog(@"Programming is fun");
//        NSLog(@"Testing...\n...1\n...2\n...3");
//        NSLog(@"The sum of %i and %i is %i", value1, value2, sum);
    }
    return 0;
}
