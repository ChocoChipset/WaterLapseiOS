//
//  WLFirstViewController.h
//  WaterLapseiOS
//
//  Created by Hector Zarate on 4/20/13.
//  Copyright (c) 2013 International Space Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface WLFirstViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
