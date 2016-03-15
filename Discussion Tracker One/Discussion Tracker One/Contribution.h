//
//  Contribution.h
//  Discussion Tracker One
//
//  Created by Liam Gong on 3/3/16.
//  Copyright © 2016 Liam Gong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contributor.h"

@interface Contribution : NSObject

-(id) initWithContributor: (Contributor*) cont;

-(void) addShoutout: (Contributor*) cont;
-(void) endNow;

@property (readonly) NSTimeInterval duration;

@property Contributor *contributor;

//Rating
//Comment
//Topic?

@end
