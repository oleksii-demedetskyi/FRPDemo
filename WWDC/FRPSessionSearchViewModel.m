//
//  FRPSessionSearchViewModel.m
//  WWDC
//
//  Created by Алексей Демедецкий on 29.11.13.
//  Copyright (c) 2013 dalog. All rights reserved.
//

#import "FRPSessionSearchViewModel.h"
#import "FRPSessionDetailsViewModel.h"

#import "FRPSessionListModel.h"
#import "FRPSessionModel.h"

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <MACollectionUtilities/MACollectionUtilities.h>
#import <libextobjc/EXTKeyPathCoding.h>
#import <libextobjc/EXTScope.h>

@implementation FRPSessionSearchViewModel

+ (instancetype)stubModel {
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

- (id)init {
    self = [super init];
    if (self == nil) return nil;
    
    RAC(self,titles) = [RACObserve(self, model.sessions) map:^id(NSArray* sessions) {
        return [sessions valueForKey:@keypath([FRPSessionModel new],title)];
    }];
    
    @weakify(self)
    RACSignal* selectedModel = [RACObserve(self, selectedTitleIndex) map:^id(NSNumber*  value) {
        @strongify(self)
        
        return self.model.sessions[value.integerValue];
    }];
    
    RAC(self, selectedSessionDetails) = [RACSignal return:[FRPSessionDetailsViewModel new]];
    RAC(self.selectedSessionDetails, session) = selectedModel;
    
    return self;
}


@end
