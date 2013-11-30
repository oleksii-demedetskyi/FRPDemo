//
//  FRPStringArrayDataSource.h
//  WWDC
//
//  Created by Алексей Демедецкий on 30.11.13.
//  Copyright (c) 2013 dalog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRPStringArrayDataSource : NSObject<UITableViewDataSource>

+ (instancetype)emptyDataSource;

@property (nonatomic, strong, readwrite) NSArray* strings;

@end
