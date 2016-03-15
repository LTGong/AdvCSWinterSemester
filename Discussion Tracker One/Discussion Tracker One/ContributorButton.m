//
//  ContributorButton.m
//  Discussion Tracker One
//
//  Created by Liam Gong on 3/8/16.
//  Copyright © 2016 Liam Gong. All rights reserved.
//

#import "ContributorButton.h"
#import <UIKit/UIKit.h>

@implementation ContributorButton

-(id) initWithContributor:(Contributor *)cont{
    if ((self = [super init])){
            }
    return self;
}


-(id) initWithContributor:(Contributor *)cont andTag: (int)tag{ // TK: refactor to main
    self = [self initWithContributor:cont];
    self.tag = tag;
    
    return self;
}

@end