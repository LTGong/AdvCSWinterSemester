//
//  Contributor.h
//  Discussion Tracker One
//
//  Created by Liam Gong on 3/3/16.
//  Copyright © 2016 Liam Gong. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface Contributor : NSObject

-(id) initWithFirstname: (NSString*) firstname Lastname: (NSString*) lastname;

@property NSString* firstName;
@property NSString* lastName;
@property (readonly) NSString* initials;

@property UIColor* idColor;
@property UIImage* userImage;

@end
