//
//  AppDelegate.h
//  UltimateParkingSpotFinderApp
//
//  Created by David LoBosco on 5/5/14.
//  Copyright (c) 2014 David LoBosco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong,nonatomic) UINavigationController *navigationController;

@property long beginHour;
@property long beginMinute;

@end
