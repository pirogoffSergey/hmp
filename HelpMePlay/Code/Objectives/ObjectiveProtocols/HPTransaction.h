//
//  HPTransaction.h
//  HelpMePlay
//
//  Created by Sergey Pirogov on 31.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HPTransaction <NSObject>

@required
- (void)execute;

@end
