//
//  TimerStart.m
//  UltimateParkingSpotFinderApp
//
//  Created by David LoBosco on 8/8/14.
//  Copyright (c) 2014 David LoBosco. All rights reserved.
//

#import "TimerStart.h"

@implementation TimerStart

static TimerStart *instance = nil;

+(TimerStart*)getInstance{
    @synchronized(self){
        if(instance==nil){
            instance = [TimerStart new];
        }
    }
    return instance;
}

-(void)calcTotalMins:(NSDateComponents*)components{
    int hr = components.hour;
    int min = components.minute;
    
    _totalMins = (hr*60)+min;
}

-(NSString*)description{
    return [NSString stringWithFormat:@"Total Minutes: %ldm",_totalMins];
}
@end
