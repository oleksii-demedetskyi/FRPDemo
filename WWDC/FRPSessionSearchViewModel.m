//
//  FRPSessionSearchViewModel.m
//  WWDC
//
//  Created by Алексей Демедецкий on 29.11.13.
//  Copyright (c) 2013 dalog. All rights reserved.
//

#import "FRPSessionSearchViewModel.h"
#import "FRPSessionDetailsViewModel.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation FRPSessionSearchViewModel

+ (instancetype)stubModel
{
    return [[self alloc] initStubModel];
}

- (id)initStubModel {
    self = [self init];
    if (self == nil) return nil;
    
    _titles = @[@"First title", @"Second Title"];
    
    RAC(self, selectedSessionDetails) = [RACObserve(self, selectedTitleIndex)
                                         mapReplace:[FRPSessionDetailsViewModel stubViewModel]];
    return self;
}

@end
