//
//  HPAlert.h
//  HelpMePlay
//
//  Created by Sergey Pirogov on 11.09.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVProgressHUD.h"


@interface HPAlert : NSObject

+ (void)showSuccesMessage:(NSString *)message;
+ (void)showErroMessage:(NSString *)message;

@end
