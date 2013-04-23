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

- (void)parseData {
    
    NSString *filename = [self testDataPath];
    
    NSString *string = [NSString stringWithContentsOfFile:filename encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@", string);
    
    [_data removeAllObjects];
    _data = [NSMutableArray new];
    
    [self readContentsOfFile:filename];
}

- (void)readContentsOfFile:(NSString *)filename {

    file.open(filename.cString);

    char buffer[100];
    file.getline(buffer, 100);
    printf(buffer);

    int i= 0;
    int cap = 55000;
    BOOL capData = YES;
    
    while (file.good() && i < cap && capData == YES) {
        [self readValues];
        i++;
    }
    
    file.close();
}

- (void)readLine {
    
    std::string buff;
    file >> buff;
    
//    std::cout << "buffer: " << buff << std::endl;
}

- (void)readValues {
    
    float time, latitude, longitude, moisture;
    file >> time >> latitude >> longitude >> moisture;
    
    if (!isnan(moisture)) {
        
        DataChunk *dataChunk = [[DataChunk alloc] init];
        dataChunk.time = time;
        dataChunk.latitude  = latitude;
        dataChunk.longitude = longitude;
        dataChunk.moisture = moisture;
        
        [self.data addObject:dataChunk];
    
//    std::cout << "buffer (values): " << "; time:" << time << "; lat: " << latitude << "; lon: " << longitude << "; moist: " << moisture << std::endl;
    }
}

- (NSString *)testDataPath {
    return [[NSBundle mainBundle] pathForResource:@"TestData1TextFormat" ofType:@"txt"];
}

@end
