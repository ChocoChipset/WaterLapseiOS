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
    [dataSource parseData];
 
    
    [dataSource.data enumerateObjectsUsingBlock:^(DataChunk *dataChunk, NSUInteger idx, BOOL *stop) {
                
            CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(dataChunk.latitude, dataChunk.longitude);
            float value = dataChunk.moisture;
        
            if (value != 0 && !isnan(dataChunk.moisture)) {
                [self addOverlayForCoordinate:coordinate withValue:value];
            }
    }];
}

- (void)addOverlayForCoordinate:(CLLocationCoordinate2D)coordinate withValue:(float)value {
    
        WLMapMeasurement *exampleOverlay = [[WLMapMeasurement alloc] initWithCoordinate:coordinate withMeasurementValue:value];
        
//        MKCoordinateSpan centerSpan = MKCoordinateSpanMake(10.005, 10.005);
//        MKCoordinateRegion centerRegion = MKCoordinateRegionMake(coordinate, centerSpan);
        [self.mapView addOverlay:exampleOverlay];
        
//        [self.mapView setRegion:centerRegion animated:YES];
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
