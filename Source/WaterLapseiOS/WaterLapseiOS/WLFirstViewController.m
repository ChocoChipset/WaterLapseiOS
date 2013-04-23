//
//  WLFirstViewController.m
//  WaterLapseiOS
//
//  Created by Hector Zarate on 4/20/13.
//  Copyright (c) 2013 International Space Apps. All rights reserved.
//

#import "WLFirstViewController.h"
#import <MapKit/MapKit.h>
#import "WLMeasurementOverlay.h"
#import "WLMapMeasurement.h"
#import "WLMapMeasurement.h"
#import "WLMoistureDataSource.h"

@interface WLFirstViewController ()

@end

@implementation WLFirstViewController


/*--------------------------------------------------------*/

#pragma mark - View Loading

/*--------------------------------------------------------*/

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    WLMoistureDataSource *dataSource = [[WLMoistureDataSource alloc] init];
 
    [dataSource iterateDataWithBlock:^(float latitude, float longitude, float moisture) {
        if (!isnan(moisture)) {
            CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
            [self addOverlayForCoordinate:coordinate withValue:moisture];
        }
    }];
}

- (void)addOverlayForCoordinate:(CLLocationCoordinate2D)coordinate withValue:(float)value {
    
        WLMapMeasurement *exampleOverlay = [[WLMapMeasurement alloc] initWithCoordinate:coordinate withMeasurementValue:value];
    
        [self.mapView addOverlay:exampleOverlay];
}

/*--------------------------------------------------------*/

#pragma mark - Memory Warning 

/*--------------------------------------------------------*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*--------------------------------------------------------*/

#pragma mark - MKMapView Delegate

/*--------------------------------------------------------*/

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay
{
    WLMapMeasurement *measurementOverlay = (WLMapMeasurement *)overlay;
    
    WLMeasurementOverlay *mapOverlayView = [[WLMeasurementOverlay alloc] initWithOverlay:measurementOverlay];
    
    return mapOverlayView;
}

/*--------------------------------------------------------*/

@end
