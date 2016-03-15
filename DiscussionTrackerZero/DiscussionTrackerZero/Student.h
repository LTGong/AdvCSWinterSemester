//
//  Student.h
//  DiscussionTrackerZero
//
//  Created by Liam Gong on 2/19/16.
//  Copyright © 2016 Liam Gong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property NSString* firstName;
@property NSString* lastname;
@property (readonly) NSString* initials;

@end
