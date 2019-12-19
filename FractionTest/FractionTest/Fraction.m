//
//  Fraction.m
//  FractionTest
//
//  Created by 徐彦军 on 2019/11/7.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction
//{
//    int numberator;
//    int denominator;
//}

@synthesize numberator, denominator;

-(void) print
{
    NSLog(@"%i/%i", numberator, denominator);
}

-(void) setTo: (int) n over: (int) d
{
    numberator = n;
    denominator = d;
}
-(void) add: (Fraction *) f
{
    numberator = numberator * f.denominator + denominator * f.numberator;
    denominator = denominator * f.denominator;
}
//-(void) setNumberator: (int) n
//{
//    numberator = n;
//}
//-(void) setDenominator: (int) d
//{
//    denominator = d;
//}
//-(int) numberator
//{
//    return numberator;
//}
//-(int) denominator{
//    return denominator;
//}

@end
