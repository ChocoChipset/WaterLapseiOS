//
//  WLMapMeasurement.h
//  WaterLapseiOS
//
//  Created by Hector Zarate on 4/21/13.
//  Copyright (c) 2013 International Space Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

extern const CLLocationCoordinate2D kExampleOverlayCoordinate;

@interface WLMapMeasurement : NSObject <MKOverlay>

@property (nonatomic, unsafe_unretained) CLLocationCoordinate2D coordinate;
@property (nonatomic, unsafe_unretained) CGFloat measurement;

-(id)initWithCoordinate:(CLLocationCoordinate2D)paramCoordinate withMeasurementValue:(CGFloat)paramValue;


@end
