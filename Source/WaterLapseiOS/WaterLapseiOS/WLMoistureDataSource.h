//
//  WLMoistureDataSource.h
//  WaterLapseiOS
//
//  Created by empty on 4/21/13.
//  Copyright (c) 2013 International Space Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataChunk : NSObject

@property (nonatomic, assign) float time;
@property (nonatomic, assign) float latitude;
@property (nonatomic, assign) float longitude;
@property (nonatomic, assign) float moisture;

@end


@interface WLMoistureDataSource : NSObject

@property (nonatomic, strong) NSMutableArray *data;

- (void)parseData;

@end
