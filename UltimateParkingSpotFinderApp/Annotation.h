//
//  Annotation.h
//  UltimateParkingSpotFinderApp
//
//  Created by David LoBosco on 5/6/14.
//  Copyright (c) 2014 David LoBosco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject <MKAnnotation>

@property(nonatomic, assign) CLLocationCoordinate2D coordinate;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *subtitle;

-(id)initWithTitle:(NSString*)newTitle withLocation:(CLLocationCoordinate2D)newLocation;
-(MKAnnotationView *)annotationView;
@end
