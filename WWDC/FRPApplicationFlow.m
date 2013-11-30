//
//  FRPApplicationFlow.m
//  WWDC
//
//  Created by Алексей Демедецкий on 29.11.13.
//  Copyright (c) 2013 dalog. All rights reserved.
//

#import "FRPApplicationFlow.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

#import "FRPSessionSearchViewController.h"

@implementation FRPApplicationFlow

+ (instancetype)defaultFlow
{
    return [self new];
}

- (void)startsInWindow:(UIWindow *)window {
    FRPSessionSearchViewController* sessionsViewController = [FRPSessionSearchViewController new];
    UINavigationController* navigation = [[UINavigationController alloc] initWithRootViewController:sessionsViewController];
    
    window.backgroundColor = [UIColor whiteColor];
    window.rootViewController = navigation;
    [window makeKeyAndVisible];
}

@end
