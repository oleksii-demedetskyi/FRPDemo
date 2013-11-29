//
//  FRPSessionDetailsViewController.m
//  WWDC
//
//  Created by Алексей Демедецкий on 29.11.13.
//  Copyright (c) 2013 dalog. All rights reserved.
//

#import "FRPSessionDetailsViewController.h"
#import "FRPSessionDetailsViewModel.h"

@implementation FRPSessionDetailsViewController

- (void)loadView
{
    UIView* view = [UIView new]; {
        view.translatesAutoresizingMaskIntoConstraints = NO;
        
        /// Structure
        
        UILabel* titleLabel = [UILabel new]; {
            titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
            
            /// Text view here
            
            [view addSubview:titleLabel];
        }
        
        UITextView* descriptionView = [UITextView new]; {
            descriptionView.translatesAutoresizingMaskIntoConstraints = NO;
            
            /// Description view here
            
            [view addSubview:descriptionView];
        }
        
        /// Laouyt
        
        /// Content
        
    }
    
    self.view = view;
}

@end
