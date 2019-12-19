//
//  main.m
//  FoundationTest
//
//  Created by 徐彦军 on 2019/11/7.
//  Copyright © 2019 徐彦军. All rights reserved.
//

//#import "AddressCard.h"
#import "AddressBook.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello world");
//        NSDictionary *glossary = @{
//            @"abstract class": @"A",
//            @"abstract clas1": @"b",
//            @"abstract clas2": @"c",
//            @"abstract clas3": @"d"
//        };
//        if ([glossary writeToFile: @"/Users/xuyanjun/workspace/oc-learning/FoundationTest/glossary.txt" atomically: YES] == NO) {
//            NSLog(@"Save to file failed");
//        }
        NSDictionary *glassary;
        glassary = [NSDictionary dictionaryWithContentsOfFile: @"/Users/xuyanjun/workspace/oc-learning/FoundationTest/glossary.txt"];
        for(NSString *key in glassary) {
            NSLog(@"%@, %@", key, glassary[key]);
        }
        
//        NSString *fname = @"/Users/xuyanjun/workspace/oc-learning/FoundationTest/testfile";
//        NSFileManager *fm;
//        NSDictionary *attr;
//
//        // 需要创建文件管理器的实例
//        fm = [NSFileManager defaultManager];
//
//        // 首先确认文件是否存在
//        if ([fm fileExistsAtPath: fname] == NO) {
//            NSLog(@"File doesn't exists!");
//            return 1;
//        }
//        // 创建一个副本
//        if ([fm copyItemAtPath: fname toPath: @"./newfile" error: NULL]) {
//            NSLog(@"Copy file failed!");
//            return 2;
//        }
        
//        NSMutableDictionary *glossary = [NSMutableDictionary dictionary];
//        glossary[@"abstract class"] = @"A class defined so other classes can inherit from it";
//        glossary[@"adopt"] = @"A adopt";
//
//        NSLog(@"abstract class %@", glossary[@"abstract class"]);
        
//        NSString *aName = @"Julia Kocke";
//        NSString *aEmail = @"jeewer@gmail.com";
//        NSString *bName = @"Tony Iannio";
//        NSString *bEmail = @"tony@gmail.com";
//        NSString *cName = @"bTony Iannio";
//        NSString *cEmail = @"tony@gmail.com";
//        NSString *dName = @"aTony Iannio111";
//        NSString *dEmail = @"tony@gmail.com";
//
//
//        AddressCard *card1 = [[AddressCard alloc] init];
//        AddressCard *card2 = [[AddressCard alloc] init];
//        AddressCard *card3 = [[AddressCard alloc] init];
//        AddressCard *card4 = [[AddressCard alloc] init];
//
//        AddressCard *myCard;
//
//        AddressBook *book = [[AddressBook alloc] initWithName: @"Linda's Address Book"];
//
//        NSLog(@"Entries in address book after creation: %i", [book entries]);
//        [card1 setName: aName andEmail: aEmail];
//        [card2 setName: bName andEmail: bEmail];
//        [card3 setName: cName andEmail: cEmail];
//        [card4 setName: dName andEmail: dEmail];
//
//        [book addCard: card1];
//        [book addCard: card2];
//        [book addCard: card3];
//        [book addCard: card4];
//        NSLog(@"Entries in address book after creation: %i", [book entries]);
//
//        [book list];
//        [book sort];
//        [book list];
        // 查找一个人
//        myCard = [book lookup: dName];
//        if (myCard != nil) {
//            [myCard print];
//        } else {
//            NSLog(@"Not Found");
//        }
//        [book removeCard: myCard];
//        [book list];
//        myCard = [book lookup: @"234"];
//        if (myCard != nil) {
//            [myCard print];
//        } else {
//            NSLog(@"Not Found");
//        }
//        [card1 setName: aName];
//        [card1 setEmail: aEmail];
//        [card1 setName: aName andEmail: aEmail];
//        [card2 setName: bName andEmail: bEmail];
//        [card1 print];
//        [card2 print];
//        NSArray *monthName = [NSArray arrayWithObject: @"A", @"B", @"C", @"D", @"E", nil];
//        NSArray *monthName = @[@"A", @"B", @"C", @"D", @"E"];
//        NSLog(@"Month    Name");
//        NSLog(@"=====    ====");
//
//        for (int i = 0; i < 5; i++) {
//            NSLog(@" %2i %@", i + 1, monthName[i]);
//        }
        
//        NSString *str = @"Program is fun";
//        NSLog(@"%@", str);
//        NSNumber *myNumber, *floatNumber, *intNumber;
//        NSInteger myInt;
//
//        //
////        intNumber = [NSNumber numberWithInteger: 100];
//        intNumber = @100;
//
//        myInt = [intNumber intValue];
//        NSLog(@"%li", (long) myInt);
//
//        myNumber = [NSNumber numberWithLong: 0xabcdef];
//        NSLog(@"%lx", [myNumber longValue]);
//
//        myNumber = [NSNumber numberWithChar: 'X'];
//        NSLog(@"%c", [myNumber charValue]);
//
//        floatNumber = [NSNumber numberWithFloat: 100.00];
//        NSLog(@"%g", [floatNumber floatValue]);
//
//        myNumber = [NSNumber numberWithDouble: 12345e+15];
//        NSLog(@"%lg", [myNumber doubleValue]);
//
//        if ([intNumber isEqualToNumber: floatNumber] == YES)
//        {
//            NSLog(@"Numbers are equal");
//        }
//        else
//        {
//            NSLog(@"Numbers are not equal");
//        }
//
//        if ([intNumber compare: myNumber] == NSOrderedAscending)
//        {
//            NSLog(@"First number is less than second");
//        }
        // insert code here...
//        NSLog(@"Hello, World!");
    }
    return 0;
}
