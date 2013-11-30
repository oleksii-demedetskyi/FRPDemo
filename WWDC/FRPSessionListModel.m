//
//  FRPSessionListModel.m
//  WWDC
//
//  Created by Алексей Демедецкий on 29.11.13.
//  Copyright (c) 2013 dalog. All rights reserved.
//

#import "FRPSessionListModel.h"
#import "FRPSessionModel.h"

#import <YAML-Framework/YAMLSerialization.h>
#import <MACollectionUtilities/MACollectionUtilities.h>
#import <libextobjc/EXTKeyPathCoding.h>

@implementation FRPSessionListModel

+ (instancetype)sessionListFromBundle
{
    NSArray*(^sessionsAtFile)(NSString*) = ^(NSString* name) {
        NSString* path = [[NSBundle mainBundle] pathForResource:name ofType:@"yml"];
        if (path == nil) return @[];
        
        NSInputStream* inputStream = [[NSInputStream alloc] initWithFileAtPath:path];
        NSError* parsingError = nil;
        NSMutableArray* array = [YAMLSerialization YAMLWithStream:inputStream
                                                          options:kYAMLReadOptionStringScalars
                                                            error:&parsingError];
        NSAssert(parsingError == nil, @"Error by parsing sessions data");
        
        return (NSArray*)[array copy];
    };
    
    NSArray* rawSessions = ({
        NSMutableArray* session = [NSMutableArray array];
        [session addObjectsFromArray:sessionsAtFile(@"2012_sessions")];
        [session addObjectsFromArray:sessionsAtFile(@"2013_sessions")];
        
        [session copy];
    });
    
    NSArray* sessions = [rawSessions ma_map:^NSArray*(NSDictionary* sessionsMap) {
        return [sessionsMap.allKeys ma_map:^FRPSessionModel*(NSString* sessionNumber) {
            NSDictionary* dataMap = sessionsMap[sessionNumber];
            
            NSString* title = dataMap[@":title"];
            NSString* description = dataMap[@":description"];
            NSString* track = dataMap[@":track"];
            
            FRPSessionModel* session = [FRPSessionModel new];
            
            [session setValue:sessionNumber forKey:@keypath(session, number)];
            [session setValue:title forKey:@keypath(session, title)];
            [session setValue:description forKey:@keypath(session, descriptionText)];
            [session setValue:track forKey:@keypath(session, track)];
            
            return session;
        }];
    }];
    
    sessions = [sessions ma_reduce:[NSArray array] block:^id(NSArray* a, NSArray* b) {
        return [a arrayByAddingObjectsFromArray:b];
    }];
    
    return [[self alloc] initWithSessions:sessions];
}

- (id)initWithSessions:(NSArray*)sessions
{
    self = [self init];
    if (self == nil) return nil;
    
    _sessions = sessions;
    
    return self;
}

+ (NSArray *)sessionsMatchingSearch:(NSString *)searchTerm
                         inSessions:(NSArray *)sessions
{
    NSArray* searchTerms = ({
        NSCharacterSet* separator = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
        [searchTerm componentsSeparatedByCharactersInSet:separator];
    });
    NSString* fuzzyTerm = [searchTerms lastObject];
    NSArray* fullTerms = ({
        NSMutableArray* terms = searchTerms.mutableCopy;
        [terms removeLastObject];
        
        [terms copy];
    });
    
    NSArray* matchingSessions = [sessions ma_select:^BOOL(FRPSessionModel* session) {
        NSArray* sessionWords = ({
            NSCharacterSet* separator = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
            NSArray* fatWords = [@[session.title,
                                   session.descriptionText,
                                   session.track]
                                 ma_map:^NSArray*(NSString* info) {
                                     return [info componentsSeparatedByCharactersInSet:separator];
                                 }];
            
            [fatWords ma_reduce:@[] block:^NSArray*(NSArray* a, NSArray* b) {
                return [a arrayByAddingObjectsFromArray:b];
            }];
        });
        NSStringCompareOptions matchOptions = ({
            NSDiacriticInsensitiveSearch | NSCaseInsensitiveSearch | NSAnchoredSearch;
        });
        
        NSMutableArray* leftFullTerms = fullTerms.mutableCopy;
        NSArray* unporocessedWords = [sessionWords ma_select:^BOOL(NSString* word) {
            NSString* match = [leftFullTerms ma_match:^BOOL(NSString* term) {
                NSRange matchRange = [word rangeOfString:term options:matchOptions];
                return (matchRange.length == word.length);
            }];
            if (match != nil) {
                [leftFullTerms removeObject:match];
                return NO;
            } else {
                return YES;
            }
        }];
        
        if (leftFullTerms.count == 0) {
            if (fuzzyTerm.length == 0) {
                return YES;
            } else {
                NSString* match = [unporocessedWords ma_match:^BOOL(NSString* word) {
                    NSRange r = [word rangeOfString:fuzzyTerm options:matchOptions];
                    
                    return r.location != NSNotFound;
                }];
                
                if (match != nil) {
                    return YES;
                } else {
                    return NO;
                }
            }
        } else {
            return NO;
        }
    }];
    
    return matchingSessions;
}

@end
