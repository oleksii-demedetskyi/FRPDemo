//
//  FRPSessionListModel.h
//  WWDC
//
//  Created by Алексей Демедецкий on 29.11.13.
//  Copyright (c) 2013 dalog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRPSessionListModel : NSObject

+ (instancetype) sessionListFromBundle;

@property (nonatomic, readonly, copy) NSArray* sessions;

+ (NSArray*)sessionsMatchingSearch:(NSString*)searchTerm
                        inSessions:(NSArray*)sessions;
+ (NSArray*)wordsInSessions:(NSArray*)sessions;

@end
