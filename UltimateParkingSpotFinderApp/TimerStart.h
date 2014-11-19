//
//  TimerStart.h
//  UltimateParkingSpotFinderApp
//
//  Created by David LoBosco on 8/8/14.
//  Copyright (c) 2014 David LoBosco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimerStart : NSObject


@property (nonatomic)long totalMins;
@property (nonatomic) NSDate* originalDate;


+(TimerStart*)getInstance;
-(NSString*)description;
-(void)calcTotalMins:(NSDateComponents *) components;
@end
