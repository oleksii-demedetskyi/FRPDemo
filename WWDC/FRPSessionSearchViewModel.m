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
    
    RACSignal* __unused allSessions = RACObserve(self, model.sessions);
    
    RACSignal* __unused filteredSessions = ({
        [RACSignal combineLatest:@[RACObserve(self, model.sessions),
                                   RACObserve(self, searchTerm)]
                          reduce:^NSArray*(NSArray* allItems, NSString* term){
                              return [FRPSessionListModel sessionsMatchingSearch:term
                                                                      inSessions:allItems];
                          }];
    }) ;
    
    RACSignal* sessions = filteredSessions;
    
    RAC(self, titles) = [sessions map:^id(NSArray* sessions) {
        return [sessions valueForKey:@keypath([FRPSessionModel new],title)];
    }];
    
    /// Suggestions.
    // 1) Take all words.
    // 2) Find all matched words
    // 3) Send to suggestion
    
    RACSignal* allWords = [RACObserve(self, model.sessions) map:^id(NSArray* sessions) {
        return [FRPSessionListModel wordsInSessions:sessions];
    }];
    
    RAC(self, suggestions) = allWords;
    
    
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
