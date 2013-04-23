//
//  WLMoistureDataSource.m
//  WaterLapseiOS
//
//  Created by empty on 4/21/13.
//  Copyright (c) 2013 International Space Apps. All rights reserved.
//

#import "WLMoistureDataSource.h"
#include <iostream>
#include <fstream>


@implementation DataChunk;
@end;


@implementation WLMoistureDataSource

static std::ifstream file;

- (void)iterateDataWithBlock:(MoistureChunkBlock)iterationStepBlock {
    [self parseDataIterateWithBlock:iterationStepBlock];
}

- (void)parseDataIterateWithBlock:(MoistureChunkBlock)iterationStepBlock {
    
    NSString *filename = [self testDataPath];
    
    NSString *string = [NSString stringWithContentsOfFile:filename encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@", string);
    
    [self readContentsOfFile:filename withBlock:iterationStepBlock];
}

- (void)readContentsOfFile:(NSString *)filename withBlock:(MoistureChunkBlock)iterationStepBlock {

    file.open(filename.cString);

    char buffer[100];
    file.getline(buffer, 100);
    printf(buffer);

    int i= 0;
    int cap = 55000;
    BOOL capData = YES;
    
    while (file.good() && i < cap && capData == YES) {
        [self readValuesWithBlock:iterationStepBlock];
        i++;
    }
    
    file.close();
}

- (void)readLine {
    
    std::string buff;
    file >> buff;
}

- (void)readValuesWithBlock:(MoistureChunkBlock)iterationStepBlock {
    
    float time, latitude, longitude, moisture;
    file >> time >> latitude >> longitude >> moisture;
    
    if (!isnan(moisture)) {
        
        if (iterationStepBlock) {
            (iterationStepBlock)(latitude, longitude, moisture);
        }
    }
}

- (NSString *)testDataPath {
    return [[NSBundle mainBundle] pathForResource:@"TestData1TextFormat" ofType:@"txt"];
}

@end
