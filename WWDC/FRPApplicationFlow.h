//
//  FRPApplicationFlow.h
//  WWDC
//
//  Created by Алексей Демедецкий on 29.11.13.
//  Copyright (c) 2013 dalog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRPApplicationFlow : NSObject

+ (instancetype)defaultFlow;

- (void)startsInWindow:(UIWindow*)window;

@end
