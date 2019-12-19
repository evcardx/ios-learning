//
//  AddressCard.h
//  FoundationTest
//
//  Created by 徐彦军 on 2019/11/8.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddressCard : NSObject
@property (copy, nonatomic) NSString *name, *email;
//-(void) setName: (NSString *) theName;
//-(void) setEmail: (NSString *) theEmail;
//-(NSString *) name;
//-(NSString *) email;

-(void) print;
-(void) setName: (NSString *) theName andEmail: (NSString *) theEmail;
@end

NS_ASSUME_NONNULL_END
