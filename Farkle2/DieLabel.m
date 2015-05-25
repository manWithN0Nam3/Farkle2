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

    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTappedLabel)];
    tapGesture2.numberOfTapsRequired = 2;
    [self addGestureRecognizer:tapGesture2];
    return self;

}


-(void)tappedLabel{



    NSLog(@"hello");


    [self.delegate onDieLabbelTapped:self];

}



-(void)doubleTappedLabel{



    NSLog(@"hello");

    [self.delegate onDieLabbelTappedDouble:self];
    
}


-(void)roll{


int random = (arc4random() % 6) + 1;
    self.text = [NSString stringWithFormat:@"%i",random];


}



@end
