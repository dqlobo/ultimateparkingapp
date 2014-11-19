//
//  CountdownViewController.h
//  UltimateParkingSpotFinderApp
//
//  Created by David LoBosco on 8/6/14.
//  Copyright (c) 2014 David LoBosco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountdownViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *counter;
@property (strong, nonatomic) NSString *time;
@property (nonatomic) int currentMins;

@end
