//
//  PaypalPaymentService.m
//  Payments_App
//
//  Created by Justine Herman on 11/4/16.
//  Copyright © 2016 Justine Herman. All rights reserved.
//

#import "PaypalPaymentService.h"

@interface PaypalPaymentService ()

- (BOOL)processPaymentAmount:(NSInteger)price;

@end

@implementation PaypalPaymentService

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
        NSLog(@"Sorry, PayPal is unable to process your amount at this time. Please try again.");
        return NO;
    } else {
        NSLog(@"Thank you! PayPal has processed your payment of $%ld.", amount);
        return YES;
    }
}


@end
