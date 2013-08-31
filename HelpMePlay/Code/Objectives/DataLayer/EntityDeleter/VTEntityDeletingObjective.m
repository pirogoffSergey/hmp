//
//  VTEntityDeletingObjective.m
//  VetApp
//
//  Created by Sergey Pirogov on 03.06.13.
//  Copyright (c) 2013 111 Minutes. All rights reserved.
//

#import "VTEntityDeletingObjective.h"
#import "HPDataBaseHelper.h"


@implementation VTEntityDeletingObjective

- (void)reach
{
    NSParameterAssert(self.entity);
    if(!self.context) {
        self.context = [HPDataBaseHelper sharedInstance].managedObjectContext;
    }
    
    [self.context deleteObject:self.entity];
    [[HPDataBaseHelper sharedInstance] saveContext];
}

@end
