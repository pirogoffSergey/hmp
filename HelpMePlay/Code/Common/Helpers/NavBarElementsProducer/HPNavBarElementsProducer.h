//
//  HPNavBarElementsProducer.h
//  HelpMePlay
//
//  Created by Sergey Pirogov on 11.09.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HPNavBarElementsProducer : NSObject

+ (UIBarButtonItem *)closeButtonWithTarget:(id)target action:(SEL)action;
+ (UIBarButtonItem *)settingsButtonWithTarget:(id)target action:(SEL)action;
+ (UIBarButtonItem *)addButtonWithTarget:(id)target action:(SEL)action;
+ (UIBarButtonItem *)doneButtonWithTarget:(id)target action:(SEL)action;

@end
