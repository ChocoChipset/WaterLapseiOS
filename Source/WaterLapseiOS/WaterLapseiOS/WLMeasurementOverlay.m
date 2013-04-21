//
//  WLMeasurementOverlay.m
//  WaterLapseiOS
//
//  Created by Hector Zarate on 4/21/13.
//  Copyright (c) 2013 International Space Apps. All rights reserved.
//

#import "WLMeasurementOverlay.h"

@implementation WLMeasurementOverlay


-(void)drawMapRect:(MKMapRect)mapRect zoomScale:(MKZoomScale)zoomScale inContext:(CGContextRef)context
{
    CGRect theRect = [self rectForMapRect:mapRect];
  
    UIColor *measurementColor = [UIColor redColor];
    
    CGContextSetFillColorWithColor(context, measurementColor.CGColor);
    
    CGContextFillRect(context, theRect);
}

@end
