//
//  DollarValueGen.m
//  Payments_App
//
//  Created by Justine Herman on 11/4/16.
//  Copyright © 2016 Justine Herman. All rights reserved.
//

#import "DollarValueGen.h"

@implementation DollarValueGen

-(NSInteger)dollarGenerator {
    
    int lowerBound = 100;
    int upperBound = 1000;
    int rndValue = lowerBound + (arc4random() % (upperBound - lowerBound));
    
    return rndValue;
}

@end
