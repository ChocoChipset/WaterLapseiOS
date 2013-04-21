//
//  WLMVPFactory.m
//  WaterLapseiOS
//
//  Created by Tomasz Wyszomirski on 4/21/13.
//  Copyright (c) 2013 International Space Apps. All rights reserved.
//

#import "WLMVPFactory.h"

@implementation WLMVPFactory

- (void)spawnMVPApp {
    
    UIView *moistureMap = [self worldSoilMoistureView];
    [self overlayViewsWithView:moistureMap];
}

- (void)overlayViewsWithView:(UIView *)topView {
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window]; 
    UIViewController *rootVC = window.rootViewController;
    
    [rootVC.view addSubview:topView];
    topView.frame = rootVC.view.frame;    
}

- (UIView *)worldSoilMoistureView {
    
    UIWebView *moistureWebView = [[UIWebView alloc] init];
    [self loadMapViewerURLIntoWebView:moistureWebView];
    
    return moistureWebView;
}

- (void)loadMapViewerURLIntoWebView:(UIWebView *)webView {
    
    [webView loadRequest:[self mapViewerHttpRequest]];
}

- (NSURLRequest *)mapViewerHttpRequest {
    
    NSString *strURL = @"http://www.ipf.tuwien.ac.at/radar/dv_new/ipfdv/index.php?dataviewer=wacmos";
    NSURL *url = [NSURL URLWithString:strURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    return request;
}

@end
