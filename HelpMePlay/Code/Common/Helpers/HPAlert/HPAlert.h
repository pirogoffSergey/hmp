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

+ (void)showSuccesMessage:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);
+ (void)showErroMessage:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);

@end