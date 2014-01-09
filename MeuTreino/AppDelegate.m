//
//  AppDelegate.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 25/03/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//


#import "AppDelegate.h"
#import "LoadDataBase.h"
#import "Treino.h"
#import "TreinoService.h"

@implementation AppDelegate


@synthesize tabBarController = _tabBarController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self loadDB];
    UIImage* tabBarBackground = [UIImage imageNamed:@"tab_bar"];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    
    UITabBarItem *tabBarItem1 = [_tabBarController.tabBar.items objectAtIndex:0];
    [tabBarItem1 setFinishedSelectedImage:[UIImage imageNamed:@"icon_profile"] withFinishedUnselectedImage:[UIImage imageNamed:@"icon_profile"]];
    
    UITabBarItem *tabBarItem2 = [_tabBarController.tabBar.items objectAtIndex:1];
    [tabBarItem2 setFinishedSelectedImage:[UIImage imageNamed:@"icon_planilha"] withFinishedUnselectedImage:[UIImage imageNamed:@"icon_planilha"]];

    UITabBarItem *tabBarItem3 = [_tabBarController.tabBar.items objectAtIndex:2];
    [tabBarItem3 setFinishedSelectedImage:[UIImage imageNamed:@"icon_meu_treino"] withFinishedUnselectedImage:[UIImage imageNamed:@"icon_meu_treino"]];
    
    UITabBarItem *tabBarItem4 = [_tabBarController.tabBar.items objectAtIndex:3];
    [tabBarItem4 setFinishedSelectedImage:[UIImage imageNamed:@"icon_history"] withFinishedUnselectedImage:[UIImage imageNamed:@"icon_history"]];
    
    Treino *treino = [[[TreinoService alloc] init] get];
    
    if (treino.key > 0 ) {
        _tabBarController.selectedIndex = 2;
    }

    self.window.rootViewController = _tabBarController;
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)loadDB{
    
//    LoadDataBase *load = [[LoadDataBase alloc]init];
//    [load initData];

    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    
    NSString *dbPath = [documentsDir stringByAppendingPathComponent:@"meutreino.sqlite"];
    
    if([fileManager fileExistsAtPath:dbPath]==NO){
        
        NSString *defaultDBPath = [[NSBundle mainBundle] pathForResource:@"meutreino" ofType: @"sqlite"];
        BOOL success = [fileManager copyItemAtPath:defaultDBPath toPath:dbPath error:&error];
        
        if(!success){
            NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
        }
    }
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
