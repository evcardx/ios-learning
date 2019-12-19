//
//  Fraction.h
//  FractionTest
//
//  Created by 徐彦军 on 2019/11/7.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Fraction : NSObject

@property int numberator, denominator;

-(void) print;
-(void) setTo: (int) n over: (int) d;
-(void) add: (Fraction *) f;
//-(void) setNumberator: (int) n;
//-(void) setDenominator: (int) d;
//-(int) numberator;
//-(int) denominator;
@end

NS_ASSUME_NONNULL_END
