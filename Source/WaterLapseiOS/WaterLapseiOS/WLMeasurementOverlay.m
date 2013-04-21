//
//  WLMeasurementOverlay.m
//  WaterLapseiOS
//
//  Created by Hector Zarate on 4/21/13.
//  Copyright (c) 2013 International Space Apps. All rights reserved.
//

#import "WLMeasurementOverlay.h"
#import "WLMapMeasurement.h"


@implementation WLMeasurementOverlay

/*--------------------------------------------------------*/

-(UIColor *)color
{
    WLMapMeasurement *mapMeasurement = (WLMapMeasurement *)self.overlay;
    
    UIColor *result;
    
    if (mapMeasurement.measurement > 0.0)
    {
        result = [UIColor orangeColor];
    }
    else if (mapMeasurement.measurement < 0.0)
    {
        result = [UIColor redColor];
    }
    else
    {
        result = [UIColor blueColor];
    }
    
    return result;
}

/*--------------------------------------------------------*/

-(void)drawMapRect:(MKMapRect)mapRect zoomScale:(MKZoomScale)zoomScale inContext:(CGContextRef)context
{
    CGRect theRect = [self rectForMapRect:[self.overlay boundingMapRect]];
    
    CGContextSetFillColorWithColor(context, self.color.CGColor);
    
    CGContextFillRect(context, theRect);
}

/*--------------------------------------------------------*/

@end
