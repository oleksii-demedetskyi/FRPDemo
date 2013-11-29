//
//  FRPSessionSearchViewController.m
//  WWDC
//
//  Created by Алексей Демедецкий on 29.11.13.
//  Copyright (c) 2013 dalog. All rights reserved.
//

#import "FRPSessionSearchViewController.h"
#import "FRPSessionSearchViewModel.h"

@interface FRPSessionSearchViewController ()

@property (nonatomic, strong) FRPSessionSearchViewModel* viewModel;

@end

@implementation FRPSessionSearchViewController

+ (instancetype)controllerWithViewModel:(FRPSessionSearchViewModel *)model
{
    return [[self alloc] initWithViewModel:model];
}

- (id)initWithViewModel:(FRPSessionSearchViewModel*)model
{
    self = [super init];
    if (self == nil) return nil;
    
    self.viewModel = model;
    
    return self;
}

- (void)loadView
{
    UIView* view = [UIView new]; {
        view.translatesAutoresizingMaskIntoConstraints = NO;
        
        /// Define components.
        
        UISearchBar* searchBar = [UISearchBar new]; {
            searchBar.translatesAutoresizingMaskIntoConstraints = NO;
            
            // Search bar here
            
            [view addSubview:searchBar];
        }
        
        UITableView* tableView = [UITableView new]; {
            tableView.translatesAutoresizingMaskIntoConstraints = NO;
            
            // table view here
            
            [view addSubview:tableView];
        }
        
        /// Layout
        
        /// Fill with data
    }
    
    self.view = view;
}

@end
