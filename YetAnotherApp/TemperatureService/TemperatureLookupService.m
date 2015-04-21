//
// Created by James Dunwoody on 21/04/15.
// Copyright (c) 2015 Odecee. All rights reserved.
//

#import "TemperatureLookupService.h"
#import "Server.h"


@interface TemperatureLookupService ()
@property (nonatomic, readonly) Server *server;
@end

@implementation TemperatureLookupService

- (void)fetchTemperatureForCity:(NSString *)name
{
    [self.server lookup];
}

@end
