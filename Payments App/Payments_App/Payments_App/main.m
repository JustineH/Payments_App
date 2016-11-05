//
//  main.m
//  Payments_App
//
//  Created by Justine Herman on 11/4/16.
//  Copyright © 2016 Justine Herman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DollarValueGen.h"
#import "InputHandler.h"
#import "PaymentGateway.h"
#import "AmazonPaymentService.h"
#import "PaypalPaymentService.h"
#import "StripePaymentService.h"
#import "ApplePaymentService.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        DollarValueGen *dollGen = [[DollarValueGen alloc] init];
        InputHandler *inputHandler = [[InputHandler alloc] init];
        PaymentGateway *paymentGateway = [[PaymentGateway alloc] init];
        AmazonPaymentService *amazonDelegate = [[AmazonPaymentService alloc] init];
        PaypalPaymentService *paypalDelegate = [[PaypalPaymentService alloc] init];
        StripePaymentService *stripeDelegate = [[StripePaymentService alloc] init];
        ApplePaymentService *appleDelegate = [[ApplePaymentService alloc] init];
        BOOL canProcess = NO;
        
        NSInteger price = [dollGen dollarGenerator];
        //NSLog(@"price: %ld", price);
        
        while (canProcess == NO) {
            
            NSString *paymentPrompt = [NSString stringWithFormat:@"Thank you for shopping at Acme.com Your total today is $%ld. Please select your payment method:  Paypal, Stripe, Amazon, or ApplePay.", price];
            
            NSInteger paymentMethod;
            paymentMethod = [inputHandler getPaymentMethod:paymentPrompt];
            
            switch(paymentMethod)
            {
                case 1:
                    paymentGateway.delegate = paypalDelegate;
                    canProcess = [paymentGateway.delegate processPaymentAmount: price];
                    break;
                case 2:
                    paymentGateway.delegate = stripeDelegate;
                    canProcess = [paymentGateway.delegate processPaymentAmount: price];
                    break;
                case 3:
                    paymentGateway.delegate = amazonDelegate;
                    canProcess = [paymentGateway.delegate  processPaymentAmount: price];
                    break;
                case 4:
                    paymentGateway.delegate = appleDelegate;
                    canProcess = [paymentGateway.delegate  processPaymentAmount: price];
                    break;
            }
        }
    
    }
    return 0;
}
