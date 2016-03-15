//
//  DiscussionGroup.h
//  Discussion Tracker One
//
//  Created by Liam Gong on 3/3/16.
//  Copyright © 2016 Liam Gong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Contributor;

@interface DiscussionGroup : UIViewController

-(id) initWithContributors: (NSArray*) contributors;
-(id)initWithNameArray: (NSArray*) nameArray;


-(int) length;
-(int) indexOf:(Contributor*) contributor;
-(Contributor*) contributorForIndex:(int) index;

@end
