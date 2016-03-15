//
//  ViewController.m
//  DiscussionTrackerZero
//
//  Created by Liam Gong on 2/17/16.
//  Copyright © 2016 Liam Gong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UIButton* currentButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray* buttons = [[NSMutableArray alloc] init];
    for (int i = 1; i <= 8 ; i++) {
        [buttons addObject: [self buttonWithNumber: i]];
    }
    
    double curAngle = M_PI/2;// starts at bottom
    double incAngle = (360.0/(buttons.count) )*M_PI/180.0;
    CGPoint circleCenter = self.view.center; /* given center */
    double circleRadius = self.view.frame.size.width/3; /* given radius */
    for (int i =0; i< buttons.count; i++){
        UIButton* button = buttons[i];
        CGPoint buttonCenter = CGPointMake(0,0);
        buttonCenter.x = circleCenter.x + cos(curAngle)*circleRadius;
        buttonCenter.y = circleCenter.y + sin(curAngle)*circleRadius;
        button.center = buttonCenter;
        [self.view addSubview: button];
        
        curAngle += incAngle;
    }

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIButton*)buttonWithNumber: (int) number{
    UIButton* myButton = [UIButton buttonWithType: UIButtonTypeCustom];
    [myButton setTitle: [@(number) stringValue] forState: UIControlStateNormal];
    [myButton setTitleColor: UIColor.blueColor forState: UIControlStateNormal];
    [myButton setBackgroundColor:[UIColor colorWithRed: drand48() green: drand48() blue: drand48() alpha:0.5f]];
    myButton.frame = CGRectMake(0.0, 0.0, 75, 75);
    myButton.layer.cornerRadius = 0.5 * myButton.bounds.size.width;
    [myButton addTarget: self action: NSSelectorFromString(@"pressedAction:") forControlEvents: UIControlEventTouchUpInside];
    myButton.tag = number;
    return myButton;
}

-(IBAction)pressedAction:(UIButton*)sender{
    UIButton *btnSdr = sender;
    
    if (self.currentButton) {
        [self drawLinkFromButton:self.currentButton toButton:btnSdr];
    }
    self.currentButton = btnSdr;
    NSLog(@"%li",(long)btnSdr.tag);
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

@end
