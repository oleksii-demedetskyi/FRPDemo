//
//  FRPSessionDetailsViewModel.h
//  WWDC
//
//  Created by Алексей Демедецкий on 29.11.13.
//  Copyright (c) 2013 dalog. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FRPSessionModel;

@interface FRPSessionDetailsViewModel : NSObject

+ (instancetype)stubViewModel;

@property (nonatomic, readonly, copy) FRPSessionModel* session;

@property (nonatomic, readonly, copy) NSString* descriptionText;
@property (nonatomic, readonly, copy) NSString* title;

@end
