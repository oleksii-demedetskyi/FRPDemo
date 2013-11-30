//
//  FRPSessionSearchViewModel.h
//  WWDC
//
//  Created by Алексей Демедецкий on 29.11.13.
//  Copyright (c) 2013 dalog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRPSessionSearchViewModel : NSObject

@property (nonatomic, readonly, copy) NSString* searchTerm;

@property (nonatomic, readonly, copy) NSArray* titles;
@property (nonatomic, readonly, copy) NSArray* suggestions;

@end
