//
//  AirPort.m
//  AirportWeather
//
//  Created by Pamela Lu-Stone on 2/7/13.
//  Copyright (c) 2013 Pamela Lu-Stone. All rights reserved.
//

#import "AirPort.h"

@implementation AirPort

@synthesize code;
@synthesize temperature;
@synthesize windSpeed;
@synthesize elevation;
@synthesize cloudsCode;
@synthesize stationName;
@synthesize dewPoint;
@synthesize humidity;
@synthesize seaLevelPressure;
@synthesize clouds;

+ (id)initBycode:(NSString *)code
{
    AirPort *newAirPort = [[self alloc] init];
    newAirPort.code = code;
    return newAirPort;
}

+ (id)initByCodeWithContent:(NSString *)code
{
    AirPort *newAirPort = [[self alloc] init];
    newAirPort.code = code;
    
    
    NSString *baseURL = @"http://ws.geonames.org/weatherIcaoJSON?ICAO=K";
    NSString *fullURL = [baseURL stringByAppendingString:newAirPort.code];
    NSURL *url = [NSURL URLWithString:fullURL];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError* error = nil;
    NSDictionary *json = [NSJSONSerialization
                          JSONObjectWithData:data //1
                          options:NSJSONReadingMutableContainers
                          error: &error];
    
    if (!json) {
        NSLog(@"Error parsing JSON: %@", error);
    }
    else {
        NSDictionary *status = nil;
        status =[json objectForKey:@"status"];
        if([status objectForKey: @"message"]!=nil)
        {
            
        }
        
        else{
            NSDictionary *subitem = [json objectForKey:@"weatherObservation"];
            
            NSArray *keys = [subitem allKeys];
            for(id key in keys){
                if([key isEqualToString:@"windSpeed"]){
                    newAirPort.windSpeed = [subitem objectForKey:key];
                }
                else if([key isEqualToString:@"elevation"]){
                    newAirPort.elevation = [subitem objectForKey:key];
                }
                else if([key isEqualToString:@"cloudsCode"]){
                    newAirPort.cloudsCode = [subitem objectForKey:key];
                }
                else if([key isEqualToString:@"stationName"]){
                    newAirPort.stationName = [subitem objectForKey:key];
                }
                else if([key isEqualToString:@"dewPoint"]){
                    newAirPort.dewPoint = [subitem objectForKey:key];
                }
                else if([key isEqualToString:@"humidity"]){
                    newAirPort.humidity = [subitem objectForKey:key];
                }
                else if([key isEqualToString:@"seaLevelPressure"]){
                    newAirPort.seaLevelPressure = [subitem objectForKey:key];
                }
                else if([key isEqualToString:@"clouds"]){
                    newAirPort.clouds = [subitem objectForKey:key];
                }
                else if([key isEqualToString:@"temperature"]){
                    newAirPort.temperature = [NSString stringWithFormat:@"%@", [subitem objectForKey:key]];
                }
                
            }
        }
    }
    
    
    return newAirPort;
}

@end

