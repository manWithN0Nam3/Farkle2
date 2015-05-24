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
@property (strong, nonatomic) IBOutletCollection(DieLabel) NSArray *labels;
@property NSMutableArray *dice;
@property (weak, nonatomic) IBOutlet ADBannerView *iad;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    for (DieLabel *label in self.labels) {
        label.delegate = self;
        label.backgroundColor = [UIColor yellowColor];
    }
}



- (IBAction)onRollTapped:(UIButton *)sender {

    for (DieLabel* label in self.labels) {

        if (label.backgroundColor == [UIColor redColor]) {

        }
        else{
        [label roll];
            }
    }
}

#pragma mark delegate method

-(void)onDieLabbelTapped:(UILabel *)label{

    label.backgroundColor = [UIColor redColor];
}

-(void)onDieLabbelTappedDouble:(UILabel *)label{

    label.backgroundColor = [UIColor yellowColor];
}

#pragma mark iAds
-(void)bannerViewDidLoadAd:(ADBannerView *)banner{
    self.iad.alpha = 1;


}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    self.iad.alpha = 0;
}

@end
