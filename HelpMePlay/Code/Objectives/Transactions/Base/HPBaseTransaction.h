//
//  HPBaseTransaction.h
//  HelpMePlay
//
//  Created by Sergey Pirogov on 23.10.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HPTransaction.h"


@interface HPBaseTransaction : NSObject <HPTransaction>

@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, assign) Class destinationControllerClass;

@end
