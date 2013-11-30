//
//  FRPSessionModel.h
//  WWDC
//
//  Created by Алексей Демедецкий on 29.11.13.
//  Copyright (c) 2013 dalog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRPSessionModel : NSObject

@property (nonatomic, readonly, copy) NSString* descriptionText;
@property (nonatomic, readonly, copy) NSString* title;
@property (nonatomic, readonly, copy) NSString* track;
@property (nonatomic, readonly, copy) NSString* number;

@end
