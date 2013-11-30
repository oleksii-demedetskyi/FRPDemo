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
#import "FRPSessionSearchViewModel.h"

#import "FRPSessionDetailsViewController.h"

@implementation FRPApplicationFlow

+ (instancetype)defaultFlow
{
    return [self new];
}

- (void)startsInWindow:(UIWindow *)window {
    FRPSessionSearchViewModel* searchViewModel = [FRPSessionSearchViewModel stubModel];
    FRPSessionSearchViewController* sessionsViewController = [FRPSessionSearchViewController new];
    UINavigationController* navigation = [[UINavigationController alloc] initWithRootViewController:sessionsViewController];
    
    sessionsViewController.title = @"Session search";
    sessionsViewController.edgesForExtendedLayout = UIRectEdgeNone;
    sessionsViewController.viewModel = searchViewModel;
    
    window.backgroundColor = [UIColor whiteColor];
    window.rootViewController = navigation;
    [window makeKeyAndVisible];
    
    FRPSessionDetailsViewController* detailsViewController = [FRPSessionDetailsViewController new];
    detailsViewController.title = @"Session details";
    detailsViewController.edgesForExtendedLayout = UIRectEdgeNone;
    
    [[RACObserve(searchViewModel, selectedSessionDetails) skip:1].logAll subscribeNext:^(FRPSessionDetailsViewModel* viewModel) {
        [navigation setViewControllers:@[sessionsViewController, detailsViewController] animated:YES];
    }];
    
    RAC(detailsViewController, viewModel) = RACObserve(searchViewModel, selectedSessionDetails);
}

@end
