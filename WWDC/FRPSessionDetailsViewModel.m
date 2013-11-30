//
//  FRPSessionDetailsViewModel.m
//  WWDC
//
//  Created by Алексей Демедецкий on 29.11.13.
//  Copyright (c) 2013 dalog. All rights reserved.
//

#import "FRPSessionDetailsViewModel.h"

@implementation FRPSessionDetailsViewModel

+ (instancetype)stubViewModel
{
    return [[self alloc] initStubViewModel];
}

- (id)initStubViewModel
{
    self = [self init];
    if (self == nil) return nil;
    
    _title = @"Stub title";
    _descriptionText = @"Stub description";
    
    return self;
}
@end
