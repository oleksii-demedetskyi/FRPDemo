//
//  FRPSessionSearchViewModel.h
//  WWDC
//
//  Created by Алексей Демедецкий on 29.11.13.
//  Copyright (c) 2013 dalog. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, FRPSessionViewModelState) {
    FRPSessionViewModelDataDisplayState,
    FRPSessionViewModelNoDataState,
    FRPSessionViewSuggestionDesplayState,
};

@interface FRPSessionSearchViewModel : NSObject

@property (nonatomic, readonly, copy) NSString* searchTerm;
@property (nonatomic, readonly, assign) FRPSessionViewModelState state;

@property (nonatomic, readonly, copy) NSArray* titles;

@end
