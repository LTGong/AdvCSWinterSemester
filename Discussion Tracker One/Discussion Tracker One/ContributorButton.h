//
//  ContributorButton.h
//  Discussion Tracker One
//
//  Created by Liam Gong on 3/8/16.
//  Copyright © 2016 Liam Gong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contributor.h"

@interface ContributorButton : UIButton

- (id)initWithContributor: (Contributor*) cont;
- (id)initWithContributor: (Contributor*) cont andTag: (int)tag;

@end
