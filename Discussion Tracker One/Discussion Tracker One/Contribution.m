//
//  Contribution.m
//  Discussion Tracker One
//
//  Created by Liam Gong on 3/3/16.
//  Copyright © 2016 Liam Gong. All rights reserved.
//

#import "Contribution.h"

@interface Contribution()

@property NSDate* begin;
@property  NSDate* end;

@property NSMutableArray *contributorsReferenced;

@end

@implementation Contribution

-(id) initWithContributor: (Contributor*) cont{
    if (([super init])) {
        self.contributor =cont;
        self.begin = [NSDate date];
    }
    
    return self;
}

#pragma mark setter only

-(void) addShoutout: (Contributor*) cont{
    [self.contributorsReferenced addObject:cont];
}

-(void) endNow{
    self.end = [NSDate date];
}

#pragma mark getter

-(NSTimeInterval) duration{
    return [self.end timeIntervalSinceDate:self.begin];
}

@end
