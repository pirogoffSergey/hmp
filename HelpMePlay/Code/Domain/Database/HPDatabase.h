//
//  HPDatabase.h
//  HelpMePlay
//
//  Created by Sergey Pirogov on 31.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface HPDatabase : NSObject

+ (User *)currentUser;
+ (void)restoreCurrentUser;
+ (User *)createUser;

@end
