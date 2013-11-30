//
//  FRPSessionDetailsViewController.m
//  WWDC
//
//  Created by Алексей Демедецкий on 29.11.13.
//  Copyright (c) 2013 dalog. All rights reserved.
//

#import "FRPSessionDetailsViewController.h"
#import "FRPSessionDetailsViewModel.h"

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Parus/Parus.h>

@implementation FRPSessionDetailsViewController

- (void)loadView
{
    UIView* view = [UIView new]; {
        view.backgroundColor = [UIColor whiteColor];
        
        /// Structure
        
        UILabel* titleLabel = [UILabel new]; {
            titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
            
            titleLabel.numberOfLines = 0;
            titleLabel.preferredMaxLayoutWidth = 300;
            
            [view addSubview:titleLabel];
        }
        UITextView* descriptionView = [UITextView new]; {
            descriptionView.translatesAutoresizingMaskIntoConstraints = NO;
            descriptionView.editable = NO;
            
            [view addSubview:descriptionView];
        }
        
        /* Layout UI */ {
            NSDictionary* views = NSDictionaryOfVariableBindings(titleLabel, descriptionView);
            [view addConstraints:
             PVGroup(@[ PVVFL(@"V:|-10-[titleLabel]-10-[descriptionView]-10-|"),
                        PVVFL(@"H:|-10-[titleLabel]-10-|"),
                        PVVFL(@"H:|-10-[descriptionView]-10-|")
                        ]).withViews(views).asArray];
        }
        
        /* Fill with content */ {
            RAC(titleLabel, text) = RACObserve(self, viewModel.title);
            RAC(descriptionView, text) = RACObserve(self, viewModel.descriptionText);
        }
   }
    
    self.view = view;
}

@end
