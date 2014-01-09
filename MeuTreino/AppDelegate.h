//
//  AppDelegate.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 25/03/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate :  NSObject <UIApplicationDelegate, UITabBarControllerDelegate> 

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (strong, nonatomic) IBOutlet UITabBarController *tabBarController;

@end
