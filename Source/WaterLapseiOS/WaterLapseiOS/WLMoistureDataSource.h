//
//  WLMoistureDataSource.h
//  WaterLapseiOS
//
//  Created by empty on 4/21/13.
//  Copyright (c) 2013 International Space Apps. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^ MoistureChunkBlock)(float latitude, float longitude, float moisture);


@interface WLMoistureDataSource : NSObject

- (void)iterateDataWithBlock:(MoistureChunkBlock)iterationStepBlock;

@end
