//
//  ViewController.m
//  Farkle2
//
//  Created by Alex Santorineos on 5/22/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import "ViewController.h"
#import <iAd/iAd.h>

@interface ViewController ()<DieLabelDelegate,ADBannerViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property NSMutableArray *dice;
@property (weak, nonatomic) IBOutlet ADBannerView *iad;
@property (weak, nonatomic) IBOutlet UIButton *bankItButton;
@property UIDynamicAnimator *dynamicAnimator;
@property (weak, nonatomic) IBOutlet DieLabel *label1;
@property (weak, nonatomic) IBOutlet DieLabel *label2;
@property (weak, nonatomic) IBOutlet DieLabel *label3;
@property (weak, nonatomic) IBOutlet DieLabel *label4;
@property (weak, nonatomic) IBOutlet DieLabel *label5;
@property (weak, nonatomic) IBOutlet DieLabel *label6;
@property NSArray *labels;
@property BOOL areButtonsFanned;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.areButtonsFanned = true;
    self.labels = @[self.label1, self.label2, self.label3, self.label4,self.label5,self.label6];

    for (DieLabel *label in self.labels) {
        label.delegate = self;
        label.backgroundColor = [UIColor yellowColor];
    }

    self.dynamicAnimator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];

//    [self.bankItButton addTarget:self action:@selector(fanButton:) forControlEvents:UIControlEventTouchUpInside];


}



#pragma mark IBAction
- (IBAction)onRollTapped:(UIButton *)sender {

    for (DieLabel* label in self.labels) {

        if (label.backgroundColor == [UIColor redColor]) {

        }
        else{
        [label roll];
            }
    }

    [self trackTheScore:_label1 andLabel2:_label2 andLabel3:_label3 andLabel4:_label4 andLabel5:_label5 andLabel6:_label6];

}

#pragma mark Helper Method
-(void)trackTheScore:(DieLabel*)label1 andLabel2:(DieLabel*)label2 andLabel3:(DieLabel*)label3 andLabel4:(DieLabel*)label4 andLabel5:(DieLabel*)label5 andLabel6:(DieLabel*)label6{

    NSString *labelValue1 = label1.text;
    double labelOneNumber = labelValue1.intValue;

    NSString *labelValue2 = label2.text;
    double labelTwoNumber = labelValue2.intValue;

    NSString *labelValue3 = label3.text;
    double labelThreeNumber = labelValue3.intValue;


    NSString *labelValue4 = label4.text;
    double labelFourValue = labelValue4.intValue;


    NSString *labelValue5 = label5.text;
    double labelFiveNumber = labelValue5.intValue ;
    

    NSString *labelValue6 = label6.text;
    double labelSixNumber = labelValue6.intValue;

    int result = labelOneNumber + labelTwoNumber + labelThreeNumber +labelFourValue +labelFiveNumber +labelSixNumber;

    self.scoreLabel.text = [NSString stringWithFormat:@"%i",result];

    



}
- (IBAction)onBankItButtonTapped:(UIButton *)sender {

    [self pushButton];

}

#pragma mark delegate method

-(void)onDieLabbelTapped:(UILabel *)label{

    label.backgroundColor = [UIColor redColor];
}


-(void)onDieLabbelTappedDouble:(UILabel *)label{

    label.backgroundColor = [UIColor yellowColor];
}


#pragma mark uiDynamics

-(void)pushButton{

    [self.dynamicAnimator removeAllBehaviors];
//
//        if (self.areButtonsFanned ==NO) {
//            [self pushIn];
//            self.areButtonsFanned = YES;
//        }else{
//            [self pushOut];
//            self.areButtonsFanned = NO;
//        }



    if (self.areButtonsFanned == true) {
        [self pushIn];
        _areButtonsFanned=false;
    }else{
        [self pushOut];
        _areButtonsFanned = true;

    }

}

// buttons go out
-(void)pushOut{
    CGPoint point;
    UISnapBehavior *snapBehavior;

    //    point = CGPointMake(300, 0);

    point = CGPointMake(80, 200);
    snapBehavior = [[UISnapBehavior alloc]initWithItem:self.label1 snapToPoint:point];
    [self.dynamicAnimator addBehavior:snapBehavior];

    point = CGPointMake(165, 200);
    snapBehavior = [[UISnapBehavior alloc]initWithItem:self.label2 snapToPoint:point];
    [self.dynamicAnimator addBehavior:snapBehavior];

    point = CGPointMake(240, 200);
    snapBehavior = [[UISnapBehavior alloc]initWithItem:self.label3 snapToPoint:point];
    [self.dynamicAnimator addBehavior:snapBehavior];


    point = CGPointMake(80, 290);
    snapBehavior = [[UISnapBehavior alloc]initWithItem:self.label4 snapToPoint:point];
    [self.dynamicAnimator addBehavior:snapBehavior];

    point = CGPointMake(165, 290);
    snapBehavior = [[UISnapBehavior alloc]initWithItem:self.label5 snapToPoint:point];
    [self.dynamicAnimator addBehavior:snapBehavior];

    point = CGPointMake(240, 290);
    snapBehavior = [[UISnapBehavior alloc]initWithItem:self.label6 snapToPoint:point];
    [self.dynamicAnimator addBehavior:snapBehavior];





}

-(void)pushIn{

    UISnapBehavior *snapBehavior;
    //    point = CGPointMake(300, 0);

    snapBehavior = [[UISnapBehavior alloc]initWithItem:self.label1 snapToPoint:self.bankItButton.center];
    [self.dynamicAnimator addBehavior:snapBehavior];

    snapBehavior = [[UISnapBehavior alloc]initWithItem:self.label2 snapToPoint:self.bankItButton.center];
    [self.dynamicAnimator addBehavior:snapBehavior];

    snapBehavior = [[UISnapBehavior alloc]initWithItem:self.label3 snapToPoint:self.bankItButton.center];
    [self.dynamicAnimator addBehavior:snapBehavior];


    snapBehavior = [[UISnapBehavior alloc]initWithItem:self.label4 snapToPoint:self.bankItButton.center];
    [self.dynamicAnimator addBehavior:snapBehavior];

    snapBehavior = [[UISnapBehavior alloc]initWithItem:self.label5 snapToPoint:self.bankItButton.center];
    [self.dynamicAnimator addBehavior:snapBehavior];

    snapBehavior = [[UISnapBehavior alloc]initWithItem:self.label6 snapToPoint:self.bankItButton.center];
    [self.dynamicAnimator addBehavior:snapBehavior];
    
    
}

#pragma mark iAds
-(void)bannerViewDidLoadAd:(ADBannerView *)banner{
    self.iad.alpha = 1;


}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    self.iad.alpha = 0;
}

@end
 