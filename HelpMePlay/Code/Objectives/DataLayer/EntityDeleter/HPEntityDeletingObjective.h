//
//  VTEntityDeletingObjective.h
//  VetApp
//
//  Created by Sergey Pirogov on 03.06.13.
//  Copyright (c) 2013 111 Minutes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HPObjective.h"

@interface HPEntityDeletingObjective : NSObject <HPObjective>

@property (nonatomic, strong) NSManagedObject *entity;
@property (nonatomic, strong) NSManagedObjectContext *context;

@end
