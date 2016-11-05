//
//  InputHandler.h
//  Payments_App
//
//  Created by Justine Herman on 11/4/16.
//  Copyright © 2016 Justine Herman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputHandler : NSObject

- (NSInteger) getPaymentMethod: (NSString *) promptString;

@end
