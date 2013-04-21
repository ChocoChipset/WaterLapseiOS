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

@interface WLFirstViewController ()

@end

@implementation WLFirstViewController


/*--------------------------------------------------------*/

#pragma mark - View Loading

/*--------------------------------------------------------*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    WLMapMeasurement *exampleOverlay = [[WLMapMeasurement alloc] initWithCoordinate:kExampleOverlayCoordinate withMeasurementValue:1.0];
    
    MKCoordinateSpan centerSpan = MKCoordinateSpanMake(0.005, 0.005);
    
    MKCoordinateRegion centerRegion = MKCoordinateRegionMake(kExampleOverlayCoordinate, centerSpan);
    [self.mapView addOverlay:exampleOverlay];
    
    [self.mapView setRegion:centerRegion animated:YES];
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
