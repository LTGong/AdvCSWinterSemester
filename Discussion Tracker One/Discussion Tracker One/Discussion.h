//
//  Discussion.h
//  Discussion Tracker One
//
//  Created by Liam Gong on 3/3/16.
//  Copyright © 2016 Liam Gong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contribution.h"
#import "DiscussionGroup.h"

@interface Discussion : NSObject

@property DiscussionGroup* discGroup;

-(id) initWithDiscussionGroup:(DiscussionGroup*) discGroup;

-(void) beginContribution: (int) cont;
-(void) addShoutout: (int) cont;
-(void) finalizeContribution;


-(Contribution*) lastCont;

@end
