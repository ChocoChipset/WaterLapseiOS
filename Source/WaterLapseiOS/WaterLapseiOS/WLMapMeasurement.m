//
//  WLMapMeasurement.m
//  WaterLapseiOS
//
//  Created by Hector Zarate on 4/21/13.
//  Copyright (c) 2013 International Space Apps. All rights reserved.
//

#import "WLMapMeasurement.h"

/*--------------------------------------------------------*/

#pragma Local Constants

/*--------------------------------------------------------*/

const CGFloat kMeasurementBoundMapRectWidthInterval = 0.00112;

/*--------------------------------------------------------*/



@implementation WLMapMeasurement

/*--------------------------------------------------------*/

#pragma mark MKOverlay delegate

/*--------------------------------------------------------*/


#warning Temporal implementation for testing purposes

-(CLLocationCoordinate2D)coordinate
{
    return CLLocationCoordinate2DMake(48.85883, 2.2945);
}

/*--------------------------------------------------------*/

-(MKMapRect)boundingMapRect
{
    MKMapPoint upperLeftCorner   = MKMapPointForCoordinate(CLLocationCoordinate2DMake(self.coordinate.latitude - kMeasurementBoundMapRectWidthInterval,
                                                                                self.coordinate.longitude + kMeasurementBoundMapRectWidthInterval));
    MKMapPoint upperRightCorner  = MKMapPointForCoordinate(CLLocationCoordinate2DMake(self.coordinate.latitude + kMeasurementBoundMapRectWidthInterval,
                                                                                self.coordinate.longitude + kMeasurementBoundMapRectWidthInterval));
    MKMapPoint bottomLeftCorner  = MKMapPointForCoordinate(CLLocationCoordinate2DMake(self.coordinate.latitude - kMeasurementBoundMapRectWidthInterval,
                                                                                self.coordinate.longitude + kMeasurementBoundMapRectWidthInterval));
    
    MKMapRect result =  MKMapRectMake(upperLeftCorner.x,
                                     upperLeftCorner.y,
                                     fabs(upperLeftCorner.x - upperRightCorner.x),
                                     fabs(upperLeftCorner.y - bottomLeftCorner.y));

    return result;
}

/*--------------------------------------------------------*/

-(BOOL)intersectsMapRect:(MKMapRect)mapRect
{
    
}

/*--------------------------------------------------------*/


@end
