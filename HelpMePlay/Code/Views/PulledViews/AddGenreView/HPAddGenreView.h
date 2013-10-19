//
//  HPAddGenreView.h
//  HelpMePlay
//
//  Created by Sergey Pirogov on 18.10.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPAddGenreView : UIView

+ (HPAddGenreView *)createView;

- (void)show;
- (void)hide;
- (void)showWithAnimationBlock:(void(^)(void))animationBlock;
- (void)hideWithAnimationBlock:(void(^)(void))animationBlock;

- (BOOL)isVisible;
- (void)clearTextField;

@property (nonatomic, copy) void (^addActionBlock)(NSString *inputedValue);

@end
