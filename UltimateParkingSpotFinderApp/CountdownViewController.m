//
//  CountdownViewController.m
//  UltimateParkingSpotFinderApp
//
//  Created by David LoBosco on 8/6/14.
//  Copyright (c) 2014 David LoBosco. All rights reserved.
//

#import "CountdownViewController.h"
#import "TimerStart.h"
#import <AudioToolbox/AudioServices.h>
@interface CountdownViewController ()
@end

@implementation CountdownViewController
@synthesize currentMins;
NSTimer *timer;
NSTimeInterval elapsed;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //_counter.text = _time;
    _counter.text = [self getHoursMins:currentMins];

    timer = [NSTimer scheduledTimerWithTimeInterval:60.0 target:self selector:@selector(decreaseTime) userInfo:nil repeats:YES];
}
-(void)decreaseTime{
    if(currentMins <= 0)
    {
        currentMins = 0;
        AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
        [timer invalidate];
        [self performSegueWithIdentifier:@"setTimer" sender:self];
    }
    else{
        elapsed = (int)[[NSDate date] timeIntervalSinceDate:[TimerStart getInstance].originalDate];
        NSLog(@"%d",(int)elapsed);
        currentMins = [TimerStart getInstance].totalMins - elapsed;
        _counter.text =[self getHoursMins:currentMins];
    }
}
-(NSString*)getHoursMins:(int)totalMins{
    
    return [NSString stringWithFormat:@"%02dh %02dm",(totalMins/60),totalMins%60];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%@",[TimerStart getInstance]);
}
- (IBAction)cancelTimer:(id)sender {
    [timer invalidate];
    [self performSegueWithIdentifier:@"setTimer" sender:self];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
