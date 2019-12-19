//
//  AddressBook.m
//  FoundationTest
//
//  Created by 徐彦军 on 2019/11/8.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import "AddressBook.h"

@implementation AddressBook
@synthesize bookName, book;

-(instancetype) initWithName: (NSString *) name
{
    self = [super init];
    if (self) {
        bookName = [NSString stringWithString: name];
        book = [NSMutableArray array];
    }
    return self;
}

-(instancetype) init
{
    return [self initWithName: @"NoName"];
}
-(void) addCard:(AddressCard *)theCard
{
    [book addObject: theCard];
}
-(void) removeCard:(AddressCard *)theCard
{
    [book removeObjectIdenticalTo: theCard];
}

-(int) entries
{
    return [book count];
}
-(void) list
{
    NSLog(@"========= Contents of: %@ ========", bookName);
    for (AddressCard *theCard in book) {
        NSLog(@"%-20s     %-32s", [theCard.name UTF8String], [theCard.email UTF8String]);
    }
    NSLog(@"==================================");
}
-(AddressCard *) lookup:(NSString *)theName
{
    for(AddressCard *nextCard in book) {
        if([nextCard.name caseInsensitiveCompare: theName] == NSOrderedSame) {
            return nextCard;
        }
    }
    return nil;
}
-(void) sort
{
    [book sortUsingSelector: @selector(compareNames:)];
}
@end
