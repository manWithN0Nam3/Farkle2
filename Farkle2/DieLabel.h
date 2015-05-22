//
//  DieLabel.h
//  Farkle2
//
//  Created by Alex Santorineos on 5/22/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol DieLabelDelegate <NSObject>

-(void)onDieLabbelTapped:(UILabel*)label;

@end

@interface DieLabel : UILabel
@property (nonatomic, assign)id<DieLabelDelegate> delegate;

-(void)roll;

@end
