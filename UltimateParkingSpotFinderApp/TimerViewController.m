//
//  TimerViewController.m
//  UltimateParkingSpotFinderApp
//
//  Created by David LoBosco on 5/5/14.
//  Copyright (c) 2014 David LoBosco. All rights reserved.
//

#import "TimerViewController.h"
#import "TimerStart.h"
#import "CountdownViewController.h"

@interface TimerViewController ()

@end

@implementation TimerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)startTimer:(id)sender {
    /*UIStoryboard *storyBoard = [self storyboard];
    CountdownViewController *vc = (CountdownViewController *)[storyBoard instantiateViewControllerWithIdentifier:@"cancelView"];
    [self presentViewController:vc animated:YES completion:nil];*/
    [self performSegueWithIdentifier:@"openTimer" sender:self];
}

- (void)viewDidLoad
{
    
    /*[[self tabBarItem] setTitle:@"Meter Clock"];
    [[self tabBarItem] setImage:[UIImage imageNamed:@"timer.png" ]];
    [super viewDidLoad];*/
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = YES;
    NSDateComponents *components = [[NSDateComponents alloc]init];
    [components setDay:(long)0];
    [components setMinute:(long)20];
    _timePicker.date =[[NSCalendar currentCalendar] dateFromComponents:components];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"openTimer"])
    {
        CountdownViewController *vc = (CountdownViewController *)[segue destinationViewController];
        
        NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:_timePicker.date];
        
        
        TimerStart *stTime = [TimerStart getInstance];
        //[stTime setHour:components.hour withMin:components.minute];
        stTime.originalDate = [NSDate date];
        [stTime calcTotalMins:components];
        NSLog(@"%@",stTime);
        
        vc.currentMins = (int)(components.minute + (components.hour * 60));
        
                   
    }
}


@end
