//
//  HPEntityCreator.h
//  HelpMePlay
//
//  Created by Sergey Pirogov on 08.09.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HPObjective.h"


@interface HPEntityCreator : NSObject <HPObjective>

@property (nonatomic, assign) Class entityClass;
@property (nonatomic, strong) NSManagedObjectContext *context;

@property (nonatomic, strong) id createdEntityObject;

@end
