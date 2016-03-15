//
//  Discussion.m
//  Discussion Tracker One
//
//  Created by Liam Gong on 3/3/16.
//  Copyright © 2016 Liam Gong. All rights reserved.
//

#import "Discussion.h"
//#import "Contribution.h"

@interface Discussion()

@property NSMutableArray* contributions;

@property Contribution* currCont;

@end

@implementation Discussion

-(id) initWithDiscussionGroup:(DiscussionGroup*) discGroup{
    if (([super init])){
        self.discGroup = discGroup;
    }
    
    return self;
}

-(Contribution*) lastCont {
    if (self.contributions.count){
        return self.contributions.lastObject;
    }else{
        return nil;
    }
}

-(void) beginContribution: (int) cont{
    _currCont = [[Contribution alloc] initWithContributor:[self.discGroup contributorForIndex:cont]];
}
-(void) addShoutout: (int) cont{
    [self.currCont addShoutout:[self.discGroup contributorForIndex:cont]];
}
-(void) finalizeContribution{
    [self.currCont endNow];
    [self.contributions addObject:_currCont];
    
    NSLog(@"Added contribution from %@ duration %f",_currCont.contributor.firstName , _currCont.duration);
}

@end

