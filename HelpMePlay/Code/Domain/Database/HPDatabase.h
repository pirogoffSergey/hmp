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

+ (void)saveDataBase;

+ (User *)currentUser;
+ (void)restoreCurrentUser;
+ (User *)createUser;
+ (User *)createUserWithDictionary:(NSDictionary *)dict;

+ (NSArray *)allAuthors;
+ (NSArray *)allGenres;
+ (NSArray *)genreWithName:(NSString *)name;

@end
