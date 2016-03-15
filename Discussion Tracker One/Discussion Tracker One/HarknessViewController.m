//
//  HarknessViewController.m
//  Discussion Tracker One
//
//  Created by Liam Gong on 3/8/16.
//  Copyright © 2016 Liam Gong. All rights reserved.
//

#import "HarknessViewController.h"
#import "DiscussionGroup.h"
#import "Contributor.h"
#import "Discussion.h"
//#import "ContributorButton.h"

@interface HarknessViewController()

@property NSArray* seatButtons;

@property UIButton* previousContributor;
@property UIButton* speakingButton;
@property Discussion* discussion;


@end

@implementation HarknessViewController

//Sample for Testing

-(void)viewDidLoad{
    NSLog(@"initializing with Default class");
    DiscussionGroup *advCSClass = [[DiscussionGroup alloc]initWithNameArray:@[
                                                                              @[@"Ben",@"Bakker"],
                                                                              @[@"Liam",@"Gong"],
                                                                              @[@"Aditya",@"Jha"],
                                                                              @[@"Markus",@"Feng"],
                                                                              @[@"Bella",@"Hutchins"],
                                                                              @[@"Kate",@"Palmer"],
                                                                              @[@"William",@"Ughetta"],
                                                                              @[@"Jack",@"Xu"],
                                                                              @[@"Anthony",@"Jonikas"],
                                                                              ]];
    
    [self setupButtonsForDiscGroup:advCSClass];

}

-(void) setupButtonsForDiscGroup:(DiscussionGroup*) discGroup{
    self.seatButtons = [self populateButtonsForDiscGroup: discGroup];
    [self arrangeButtons: self.seatButtons];
}

-(NSArray*) populateButtonsForDiscGroup:(DiscussionGroup*) discGroup{
    NSMutableArray* buttonArr = [[NSMutableArray alloc]init];
    for (int i = 0; i< discGroup.length; i++){
        [buttonArr addObject: [self buttonForContributor: [discGroup contributorForIndex:i] andTag:i]];
    }
    return [[NSArray alloc]initWithArray:buttonArr]; //returns non-mutable copy.
}

-(UIButton*)buttonForContributor:(Contributor*)cont andTag: (int)tag {
    UIButton* resBut = [UIButton buttonWithType:UIButtonTypeCustom];
    if (cont.userImage){
        resBut.imageView.image = cont.userImage;
    }else{
        [resBut setTitle:cont.initials forState:UIControlStateNormal];
        [resBut setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
        
        [resBut setBackgroundColor:cont.idColor];
    }
    [resBut addTarget: self action: NSSelectorFromString(@"seatPressedAction:") forControlEvents:UIControlEventTouchUpInside];
    resBut.tag = tag;
    return resBut;
}

-(void) arrangeButtons: (NSArray*) seatButtons{
    
    double smallCircleRadius = 100;
    
    double startAngle = M_PI/2;// starts at bottom
    double incrementAngle = (360.0/(seatButtons.count) )*M_PI/180.0;
    CGPoint circleCenter = self.view.center; /* given center */
    double constrainingDimension = MIN(self.view.frame.size.height, self.view.frame.size.width);
    double largeCircleRadius = constrainingDimension/2 - smallCircleRadius;
    
    
    
    double currentAngle = startAngle;
    for (int i =0; i< seatButtons.count; i++){
        
        UIButton* button = seatButtons[i];
        
        [button setFrame:CGRectMake(0, 0, smallCircleRadius, smallCircleRadius)];
        button.layer.cornerRadius = 0.5 * button.bounds.size.width; // circularizes
        
        CGPoint buttonCenter = CGPointMake(0,0);
        buttonCenter.x = circleCenter.x + cos(currentAngle)*largeCircleRadius;
        buttonCenter.y = circleCenter.y + sin(currentAngle)*largeCircleRadius;
        button.center = buttonCenter;
        
        [self.view addSubview: button];
        
        currentAngle += incrementAngle;
    }
    
}


-(IBAction)seatPressedAction:(UIButton*)sender{
    
    UIButton* btnSdr = sender;
    int index = btnSdr.tag;
    NSLog(@"%li",(long)btnSdr.tag);
    if (!self.speakingButton) {
        self.speakingButton = sender;
        [self.discussion beginContribution:index];
        
        if (self.previousContributor) {
            [self drawCurveFromButton:self.previousContributor toButton:self.speakingButton];
        }
    }else{
        if (sender == self.speakingButton) {
            self.speakingButton = nil;
            [self.discussion finalizeContribution];
        }else{
            [self.discussion addShoutout:index];
            [self drawLinkFromButton:self.speakingButton toButton:sender];
            self.previousContributor = self.speakingButton;
            self.speakingButton = nil;
        }
    }
}



-(void)makeLineLayer:(CALayer *)layer lineFromPointA:(CGPoint)pointA toPointB:(CGPoint)pointB
{
    CAShapeLayer *line = [CAShapeLayer layer];
    UIBezierPath *linePath=[UIBezierPath bezierPath];
    [linePath moveToPoint: pointA];
    [linePath addLineToPoint:pointB];
    line.path=linePath.CGPath;
    line.fillColor = nil;
    line.opacity = 1.0;
    line.strokeColor = [UIColor redColor].CGColor;
    [layer addSublayer:line];
}

-(void) drawLinkFromButton:(UIButton*)firstButton toButton: (UIButton*) secondButton{
    
    [self makeLineLayer:self.view.layer lineFromPointA:firstButton.center toPointB:secondButton.center];
}

-(void)makeCurveLayer:(CALayer *)layer lineFromPointA:(CGPoint)pointA toPointB:(CGPoint)pointB
{
    CAShapeLayer *line = [CAShapeLayer layer];
    UIBezierPath *linePath=[UIBezierPath bezierPath];
    [linePath moveToPoint: pointA];
    [linePath addQuadCurveToPoint:pointB controlPoint:self.view.center];
    line.path=linePath.CGPath;
    line.fillColor = nil;
    line.opacity = 1.0;
    line.strokeColor = [UIColor blackColor].CGColor;
    [layer addSublayer:line];
}

-(void) drawCurveFromButton:(UIButton*)firstButton toButton: (UIButton*) secondButton{
    
    [self makeLineLayer:self.view.layer lineFromPointA:firstButton.center toPointB:secondButton.center];
}

@end
