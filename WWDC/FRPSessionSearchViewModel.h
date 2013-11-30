//
//  FRPSessionSearchViewModel.h
//  WWDC
//
//  Created by Алексей Демедецкий on 29.11.13.
//  Copyright (c) 2013 dalog. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FRPSessionDetailsViewModel;
@class FRPSessionListModel;

@interface FRPSessionSearchViewModel : NSObject

+ (instancetype)stubModel;

@property (nonatomic, strong) FRPSessionListModel* model;

@property (nonatomic, readonly, copy) NSString* searchTerm;

@property (nonatomic, readonly, copy) NSArray* titles;
@property (nonatomic, readonly, copy) NSArray* suggestions;

@property (nonatomic, readonly, copy) NSNumber* selectedTitleIndex;
@property (nonatomic, readonly) FRPSessionDetailsViewModel* selectedSessionDetails;

@end
