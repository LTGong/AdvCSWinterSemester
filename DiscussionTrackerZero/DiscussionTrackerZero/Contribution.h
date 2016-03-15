//
//  Contribution.h
//  DiscussionTrackerZero
//
//  Created by Liam Gong on 2/19/16.
//  Copyright © 2016 Liam Gong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Student;
@class Discussion;

@interface Contribution : NSObject

@property NSDate* startTime;
@property NSTimeInterval duration;
@property Student* stu;




@end
