//
//  Student.m
//  DiscussionTrackerZero
//
//  Created by Liam Gong on 2/19/16.
//  Copyright © 2016 Liam Gong. All rights reserved.
//

#import "Student.h"

@implementation Student

-(id) initWithFirstname: (NSString*) firstname Lastname: (NSString*) lastname {
    if ((self = [super init])) {
        self.firstName = firstname;
        self.lastname = lastname;
    }
    return self;
}

-(NSString*) initials{
    NSString* result = @"";
    if(self.firstName.length >0){
        result = [self.firstName substringToIndex:1].capitalizedString;
    }
    if (self.lastname.length >0) {
        result = [result stringByAppendingString:[self.lastname substringToIndex:1].capitalizedString];
    }
    
    return result;
}

@end
