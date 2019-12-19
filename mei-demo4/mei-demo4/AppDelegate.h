//
//  AppDelegate.h
//  mei-demo4
//
//  Created by 徐彦军 on 2019/11/9.
//  Copyright © 2019 徐彦军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentCloudKitContainer *persistentContainer;

- (void)saveContext;


@end

