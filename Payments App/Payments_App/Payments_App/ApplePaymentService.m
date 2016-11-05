//
//  ApplePaymentService.m
//  Payments_App
//
//  Created by Justine Herman on 11/4/16.
//  Copyright © 2016 Justine Herman. All rights reserved.
//

#import "ApplePaymentService.h"

@interface ApplePaymentService ()

- (BOOL)processPaymentAmount:(NSInteger)price;

@end

@implementation ApplePaymentService

- (void)randBOOL {
    
    int lowerBound = 0;
    int upperBound = 2;
    int rndValue = lowerBound + (arc4random() % (upperBound - lowerBound));
    
    if (rndValue == 0)
    {
        self.canProcessPayment = NO;
    }
    else
    {
        self.canProcessPayment = YES;
    }
}

- (BOOL)processPaymentAmount:(NSInteger)amount {
    
    [self randBOOL];
    if (self.canProcessPayment == NO)
    {
        NSLog(@"Sorry, ApplePay is unable to process your amount at this time. Please try again.");
        return NO;
    }
    else
    {
        NSLog(@"Thank you! ApplePay has processed your payment of $%ld.", amount);
        return YES;
    }
}

@end
