//
//  StripePaymentService.m
//  Payments_App
//
//  Created by Justine Herman on 11/4/16.
//  Copyright © 2016 Justine Herman. All rights reserved.
//

#import "StripePaymentService.h"

@interface StripePaymentService ()

- (BOOL)processPaymentAmount:(NSInteger)price;

@end

@implementation StripePaymentService

-(BOOL)randomBOOL {
    
    int lowerBound = 0;
    int upperBound = 2;
    int boolValue = lowerBound + (arc4random() % (upperBound - lowerBound));
    
    if (boolValue == 0) {
        self.canProcessPayment = NO;
    } else {
        self.canProcessPayment = YES;
    }
    return self.canProcessPayment;
}

-(BOOL)processPaymentAmount:(NSInteger)amount {
    
    [self randomBOOL];
    if (self.canProcessPayment == NO) {
        NSLog(@"Sorry, Stripe is unable to process your amount at this time. Please try again.");
        return NO;
    } else {
        NSLog(@"Thank you! Stripe has processed your payment of $%ld.", amount);
        return YES;
    }
}
@end
