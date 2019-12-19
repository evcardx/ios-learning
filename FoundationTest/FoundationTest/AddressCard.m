//
//  AddressCard.m
//  FoundationTest
//
//  Created by 徐彦军 on 2019/11/8.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import "AddressCard.h"

@implementation AddressCard
//{
//    NSString *name;
//    NSString *email;
//}

//-(void) setName: (NSString *) theName
//{
//    if ( name != theName)
//        name = [NSString stringWithString: theName];
//}
//-(void) setEmail: (NSString *) theEmail
//{
//    if (email != theEmail)
//        email = [NSString stringWithString: theEmail];
//}
//-(NSString *) name
//{
//    return name;
//}
//-(NSString *) email
//{
//    return email;
//}
@synthesize name, email;

-(void) setName: (NSString *) theName andEmail: (NSString *) theEmail
{
    self.name = theName;
    self.email = theEmail;
}
-(BOOL) isEqual:(AddressCard *) theCard
{
    if ([name isEqualToString: theCard.name] == YES &&
        [email isEqualToString: theCard.email] == YES) {
        return YES;
    }
    return NO;
}
-(NSComparisonResult) compareNames: (id) element
{
    return [name compare: [element name]];
}
-(void) print
{
    NSLog(@"=========================================");
    NSLog(@"|                                      |");
    NSLog(@"|   %-31s    |", [name UTF8String]);
    NSLog(@"|   %-31s    |", [email UTF8String]);
    NSLog(@"|                                      |");
    NSLog(@"|                                      |");
    NSLog(@"|                                      |");
    NSLog(@"|                                      |");
    NSLog(@"|   O                            O     |");
    NSLog(@"=========================================");
}
@end
