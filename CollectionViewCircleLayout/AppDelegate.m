//
//  AppDelegate.m
//  CollectionViewCircleLayout
//
//  Created by AnujKosambi on 23/02/15.
//  Copyright (c) 2015 AnujKosambi. All rights reserved.
//

#import "AppDelegate.h"
#define ConvertIntToId(key) [NSNumber numberWithLong:key]

@interface AppDelegate () {
    CollectionController *colletionController;
    CollectionDataSource *collectionDataSource;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    CollectionAlbumLayout *circleLayout = [[CollectionAlbumLayout alloc] init];
    NSMutableDictionary *dummyDictionary  = [[NSMutableDictionary alloc]init];
    for (int j = 0; j < 2 ; j++) {
        NSMutableArray *array = [[NSMutableArray alloc]init];
        for (int i = 1; i <= (j+1) * 10; i++) {
            [array addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i]]];
        }
        [dummyDictionary setObject:array forKey:ConvertIntToId(j)];

    }
    
    colletionController = [[CollectionController alloc]initWithCollectionViewLayout:circleLayout];
    collectionDataSource = [[CollectionDataSource alloc] initWithDataSource:dummyDictionary];
    colletionController.collectionView.dataSource = collectionDataSource;
    colletionController.collectionView.delegate = circleLayout;

    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = colletionController;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
