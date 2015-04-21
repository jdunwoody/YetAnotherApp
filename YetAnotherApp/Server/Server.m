//
// Created by James Dunwoody on 21/04/15.
// Copyright (c) 2015 Odecee. All rights reserved.
//

#import "Server.h"

#import "AFHTTPRequestOperationManager.h"

@interface Server ()
@property (nonatomic, readonly) NSString *urlString;
@end

@implementation Server

- (instancetype)init
{
    self = [super init];
    if (!self) {
        return self;
    }

    _urlString = @"localhost";

    return self;
}

- (void)lookup
{
    [[AFHTTPRequestOperationManager manager] GET:self.urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

    }];
}

@end
