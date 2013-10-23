//
//  HPToSongsList.h
//  HelpMePlay
//
//  Created by Sergey Pirogov on 23.10.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HPTransaction.h"


@interface HPToSongsList : NSObject <HPTransaction>

@property (nonatomic, strong) UINavigationController *navigationController;

@end
