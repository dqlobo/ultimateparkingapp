//
//  Annotation.m
//  UltimateParkingSpotFinderApp
//
//  Created by David LoBosco on 5/6/14.
//  Copyright (c) 2014 David LoBosco. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation
@synthesize coordinate, subtitle, title;

-(id)initWithTitle:(NSString*)newTitle withLocation:(CLLocationCoordinate2D)newLocation{
    self = [super init];
    if(self){
        title = newTitle;
        coordinate = newLocation;
    }
    return self;
}

-(MKAnnotationView *)annotationView{
    MKAnnotationView *annotationView= [[MKAnnotationView alloc]
                                      initWithAnnotation:self
                                      reuseIdentifier:@"MyCustomAnnotation"];
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    annotationView.image = [UIImage imageNamed:@"redcar.png"];
    //annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    return annotationView;
}

@end
