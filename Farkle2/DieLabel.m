//
//  DieLabel.m
//  Farkle2
//
//  Created by Alex Santorineos on 5/22/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import "DieLabel.h"

@implementation DieLabel

- (id) initWithCoder:(NSCoder *)aDecoder {

    self = [super initWithCoder:aDecoder];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tappedLabel)];

    [self addGestureRecognizer:tapGesture];
    return self;

}


-(void)tappedLabel{



    NSLog(@"hello");


    [self.delegate onDieLabbelTapped:self];

}


-(void)roll{


int random = (arc4random() % 6) + 1;
    self.text = [NSString stringWithFormat:@"%i",random];


}

@end
