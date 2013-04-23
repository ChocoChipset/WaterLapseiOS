//
//  WLMapMeasurement.m
//  WaterLapseiOS
//
//  Created by Hector Zarate on 4/21/13.
//  Copyright (c) 2013 International Space Apps. All rights reserved.
//

#import "WLMapMeasurement.h"


/*--------------------------------------------------------*/

#pragma mark - Local Constants

/*--------------------------------------------------------*/

const CGFloat kMeasurementBoundMapRectWidthInterval = 1.00237;
const CLLocationCoordinate2D kExampleOverlayCoordinate = {48.85883, 2.2945};

/*--------------------------------------------------------*/



@implementation WLMapMeasurement

/*--------------------------------------------------------*/

#pragma mark - MKOverlay delegate

/*--------------------------------------------------------*/

-(id)initWithCoordinate:(CLLocationCoordinate2D)paramCoordinate withMeasurementValue:(CGFloat)paramValue
{
    self = [super init];
    
    if (self)
    {
        _coordinate = paramCoordinate;
        _measurement = paramValue;
    }
    
    return self;
}

/*--------------------------------------------------------*/

#pragma mark - MKOverlay delegate

/*--------------------------------------------------------*/

-(MKMapRect)boundingMapRect
{
    
    MKMapPoint upperLeftCorner   = MKMapPointForCoordinate(CLLocationCoordinate2DMake(self.coordinate.latitude,
                                                                                self.coordinate.longitude));
    MKMapPoint lowerRightCorner  = MKMapPointForCoordinate(CLLocationCoordinate2DMake(self.coordinate.latitude - kMeasurementBoundMapRectWidthInterval,
                                                                                self.coordinate.longitude + kMeasurementBoundMapRectWidthInterval));

    CGFloat width = fabs(lowerRightCorner.x - upperLeftCorner.x);
    CGFloat height = fabs(lowerRightCorner.y - upperLeftCorner.y);
    
    
    MKMapRect result =  MKMapRectMake(upperLeftCorner.x,
                                     upperLeftCorner.y,
                                     width,
                                     height);
    return result;
}

@end
