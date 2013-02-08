//
//  AirPort.h
//  AirportWeather
//
//  Created by Pamela Lu-Stone on 2/7/13.
//  Copyright (c) 2013 Pamela Lu-Stone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AirPort : NSObject{
    NSString *code;
    NSString *temperature;
    NSString *windSpeed;
    NSString *elevation;
    NSString *cloudsCode;
    NSString *stationName;
    NSString *dewPoint;
    NSString *humidity;
    NSString *seaLevelPressure;
    NSString *clouds;
}

@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *temperature;
@property (nonatomic, copy) NSString *windSpeed;
@property (nonatomic, copy) NSString *elevation;
@property (nonatomic, copy) NSString *cloudsCode;
@property (nonatomic, copy) NSString *stationName;
@property (nonatomic, copy) NSString *dewPoint;
@property (nonatomic, copy) NSString *humidity;
@property (nonatomic, copy) NSString *seaLevelPressure;
@property (nonatomic, copy) NSString *clouds;

+ (id)initBycode: (NSString*)code;
+ (id)initByCodeWithContent: (NSString*)code;

@end
