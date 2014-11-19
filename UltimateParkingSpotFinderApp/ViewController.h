//
//  ViewController.h
//  UltimateParkingSpotFinderApp
//
//  Created by David LoBosco on 5/5/14.
//  Copyright (c) 2014 David LoBosco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController
<CLLocationManagerDelegate,MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *map;

@end
