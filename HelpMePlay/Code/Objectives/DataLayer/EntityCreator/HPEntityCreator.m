//
//  HPEntityCreator.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 08.09.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPEntityCreator.h"
#import "HPDataBaseHelper.h"

@implementation HPEntityCreator

- (void)reach
{
    NSParameterAssert(self.entityClass);
    NSParameterAssert([self.entityClass isSubclassOfClass:[NSManagedObject class]]);
    
    if(!self.context) {
        self.context = [HPDataBaseHelper sharedInstance].managedObjectContext;
    }
    
    
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:NSStringFromClass(self.entityClass)
                                                         inManagedObjectContext:self.context];
    self.createdEntityObject = [[self.entityClass alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:self.context];
    [[HPDataBaseHelper sharedInstance] saveContext];
}

@end
