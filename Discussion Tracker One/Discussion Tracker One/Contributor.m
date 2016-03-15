//
//  Contributor.m
//  Discussion Tracker One
//
//  Created by Liam Gong on 3/3/16.
//  Copyright © 2016 Liam Gong. All rights reserved.
//

#import "Contributor.h"

@implementation Contributor

-(id) initWithFirstname: (NSString*) firstname Lastname: (NSString*) lastname {
    if ((self = [super init])) {
        self.firstName = firstname;
        self.lastName = lastname;
        self.idColor =  [self randomColor];
        self.userImage = [[UIImage alloc]initWithContentsOfFile:[firstname stringByAppendingString:lastname]];
    }
    
    return self;
}


-(UIColor*) randomColor{ // source: https://gist.github.com/kylefox/1689973 
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}

-(NSString*) initials{
    NSString* result = @"";
    if(self.firstName.length >0){
        result = [self.firstName substringToIndex:1].capitalizedString;
    }
    if (self.lastName.length >0) {
        result = [result stringByAppendingString:[self.lastName substringToIndex:1].capitalizedString];
    }
    
    return result;
}

@end
