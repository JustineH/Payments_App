//
//  InputHandler.m
//  Payments_App
//
//  Created by Justine Herman on 11/4/16.
//  Copyright © 2016 Justine Herman. All rights reserved.
//

#import "InputHandler.h"

@interface InputHandler()

@property (nonatomic) NSDictionary *commands;

@end

@implementation InputHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        _commands = @{@"paypal": @1, @"stripe": @2, @"amazon": @3, @"applepay": @4};
    }
    return self;
}

- (NSString *) inputForPrompt:(NSString *)promptString {
    
    NSLog(@"%@", promptString);
    char inputChars[255];
    fgets(inputChars, 255, stdin);
    NSString *userInput = [NSString stringWithCString:inputChars
                                            encoding:NSUTF8StringEncoding];
    userInput = [userInput stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    //NSLog(@"You've chosen to pay using %@", userInput);
    
    return userInput;
}

- (NSInteger)commandNumber:(NSString *) command {
    
    NSString *userInput = [command lowercaseString];
    if ([userInput isEqualToString:@"paypal"] || [userInput isEqualToString:@"stripe"] || [userInput isEqualToString:@"amazon"] || [userInput isEqualToString:@"applepay"]) {
          return [[self.commands objectForKey:userInput] integerValue];
    } else {
        return [self commandNumber: [self inputForPrompt:@"Invalid payment method. Please try again."]];
    }
}

- (NSInteger)getPaymentMethod: (NSString *) promptString {
    
    NSInteger payment;
    payment = [self commandNumber: [self inputForPrompt: promptString]];
    return payment;
}


@end
