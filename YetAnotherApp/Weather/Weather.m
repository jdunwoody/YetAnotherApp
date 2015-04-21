//
// Created by James Dunwoody on 21/04/15.
// Copyright (c) 2015 Odecee. All rights reserved.
//

#import "Weather.h"
#import "TemperatureLookupService.h"


@interface Weather ()
@property (nonatomic, readonly) TemperatureLookupService *temperatureLookupService;
@end

@implementation Weather

- (instancetype)initWithCityName:(NSString *)cityName
{
    self = [super init];
    if (!self) {
        return self;
    }

    _cityName = cityName;

    return self;
}

- (void)refreshTemperature
{
    [self.temperatureLookupService fetchTemperatureForCity:self.cityName];
}


@end
