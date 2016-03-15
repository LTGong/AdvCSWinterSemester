//
//  DiscussionGroup.m
//  Discussion Tracker One
//
//  Created by Liam Gong on 3/3/16.
//  Copyright © 2016 Liam Gong. All rights reserved.
//

#import "DiscussionGroup.h"
#import "Contributor.h"

@interface DiscussionGroup()

@property NSArray* contributors;

@end

@implementation DiscussionGroup

#pragma mark initializers

-(id) initWithContributors: (NSArray*) contributors{
    if ((self = [super init])) {
        self.contributors = contributors;//Stores as non-mutable.
             }
    return self;
}

-(id)initWithNameArray: (NSArray*) nameArray{//sloppy TK refactor.
    NSMutableArray* tempArr = [[NSMutableArray alloc] init];
    for (NSArray* name in nameArray) {
        Contributor* cont = [[Contributor alloc] initWithFirstname:name[0] Lastname:name[1]];
        [tempArr addObject: cont];
        }
    return [self initWithContributors:tempArr];
}

#pragma mark getters & setters



-(int) indexOf:(Contributor*) contributor{
    for (int i = 0; i < self.contributors.count; i++) {
        if (contributor ==  self.contributors[i]) {
            return i;
        }
    }
    return -1;
}

-(int) length{
    return self.contributors.count;
}

-(Contributor*) contributorForIndex:(int) index{
    return self.contributors[index];
}



@end
