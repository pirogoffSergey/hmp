//
//  HPNavBarElementsProducer.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 11.09.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPNavBarElementsProducer.h"

@implementation HPNavBarElementsProducer

+ (UIBarButtonItem *)closeButtonWithTarget:(id)target action:(SEL)action
{
    return [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStyleDone target:target action:action];
}

@end
