//
//  ViewController.m
//  UltimateParkingSpotFinderApp
//
//  Created by David LoBosco on 5/5/14.
//  Copyright (c) 2014 David LoBosco. All rights reserved.
//

#import "ViewController.h"
#import "Annotation.h"

@interface ViewController (){
    CLLocationManager *manager;
    Annotation *parkingSpot;
}

@end

@implementation ViewController

@synthesize map;

- (void)viewDidLoad
{
    manager = [CLLocationManager new];
    
    
    map.delegate = self;
    manager.delegate = self;
    manager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [manager startUpdatingLocation];
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(manager.location.coordinate,1,1);
    [map setRegion:viewRegion animated:YES];
    
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setSpot:(id)sender {
    [map removeAnnotations:map.annotations];
    parkingSpot = [[Annotation alloc] initWithTitle:@"Your Car!" withLocation:manager.location.coordinate];
    [map addAnnotation:parkingSpot];
}

-(MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    if([annotation isKindOfClass:[Annotation class]]){
        Annotation *myAnn = (Annotation*)annotation;
        
        MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"customAnn"];
        
        if(!annotationView)
            annotationView = myAnn.annotationView;
        else annotationView.annotation = annotation;
        return annotationView;
    }else return nil;
}

- (IBAction)getSpot:(id)sender {
    if(!parkingSpot){
        NSLog(@"Not Init. - There has not been a spot saved yet.");
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(manager.location.coordinate, 1, 1);
        [map setRegion:viewRegion animated:YES];
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"No spot has been saved."
                              message:@"Click \"Mark New Spot\" to save a location."
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];

    }else{
        CLLocationCoordinate2D midpoint;
        midpoint.latitude = (parkingSpot.coordinate.latitude+manager.location.coordinate.latitude)/2;
        midpoint.longitude =(parkingSpot.coordinate.longitude+manager.location.coordinate.longitude)/2;
        
        double latDifference= fabs(parkingSpot.coordinate.latitude-manager.location.coordinate.latitude);
        double lonDifference= fabs(parkingSpot.coordinate.longitude-manager.location.coordinate.longitude);
        
        MKCoordinateSpan locationSpan;
        locationSpan.latitudeDelta=fabs(manager.location.coordinate.latitude - parkingSpot.coordinate.latitude)
                                        +.01*latDifference;
        
        locationSpan.longitudeDelta=fabs(manager.location.coordinate.longitude - parkingSpot.coordinate.longitude)
                                        +.01*lonDifference;

        MKCoordinateRegion viewRegion = MKCoordinateRegionMake(midpoint, locationSpan);
        [map setRegion:viewRegion animated:YES];
    }
}

#pragma mark - MKMapView Delegate Methods
 /* -(MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
  MKPinAnnotationView *MyPin=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"current"];
    //MyPin.pinColor = MKPinAnnotationColorPurple;
    
    UIButton *advertButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [advertButton addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    
    MyPin.rightCalloutAccessoryView = advertButton;
     //MyPin.draggable = YES;
     
     MyPin.animatesDrop=TRUE;
     MyPin.canShowCallout = YES;
    MyPin.highlighted = NO;
    MyPin.image = [UIImage imageNamed:@"redcar.png"];
  
    return nil;
}  */

@end
