//
//  PaymentGateway.h
//  Payments_App
//
//  Created by Justine Herman on 11/4/16.
//  Copyright © 2016 Justine Herman. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PaymentDelegate

@property (nonatomic) BOOL canProcessPayment;

-(BOOL)processPaymentAmount:(NSInteger)amount;

@end

@interface PaymentGateway : NSObject

@property (nonatomic, strong) id <PaymentDelegate> delegate;


@end
