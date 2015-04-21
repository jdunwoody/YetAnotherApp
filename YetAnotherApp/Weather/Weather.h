//
// Created by James Dunwoody on 21/04/15.
// Copyright (c) 2015 Odecee. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Weather : NSObject

@property (nonatomic, readonly) NSString *cityName;

- (instancetype)init __unavailable;
- (instancetype)initWithCityName:(NSString *)cityName;

-(void)refreshTemperature;

@end
