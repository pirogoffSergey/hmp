//
//  HPAddGenreView.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 18.10.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPAddGenreView.h"


static CGFloat const cAnimationDuration = 0.33;


@interface HPAddGenreView ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end


@implementation HPAddGenreView

+ (HPAddGenreView *)createView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:self options:nil] lastObject];
}


- (void)awakeFromNib
{
    [self setup];
}

- (void)setup
{
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)]];
}


#pragma mark -
#pragma mark Actions

- (IBAction)addButtonPressed:(id)sender
{
    NSLog(@"add");
}

- (void)didTap:(UITapGestureRecognizer *)gr
{
    RESIGN_ALL;
}


#pragma mark -
#pragma mark Public Methods

- (void)show
{
    [self setOriginY:0 withAnimationdBlock:nil animated:NO];
}

- (void)hide
{
    [self setOriginY:-self.frame.size.height withAnimationdBlock:nil animated:NO];
    NSLog(@"frame = %@", [NSValue valueWithCGRect: self.frame]);
}

- (void)showWithAnimationBlock:(void(^)(void))animationBlock
{
    [self setOriginY:0 withAnimationdBlock:animationBlock animated:YES];
    NSLog(@"frame show = %@", [NSValue valueWithCGRect: self.frame]);
}

- (void)hideWithAnimationBlock:(void(^)(void))animationBlock;
{
    [self setOriginY:-self.frame.size.height withAnimationdBlock:animationBlock animated:YES];
}

- (BOOL)isVisible
{
    if (self.frame.origin.y >= 0) {
        return YES;
    } else {
        return NO;
    }
}


#pragma mark -
#pragma mark Helpers

- (void)setOriginY:(CGFloat)originY withAnimationdBlock:(void(^)(void))animationBlock animated:(BOOL)animated
{
    CGFloat animationDuration = (animated) ? cAnimationDuration : 0;
    
    CGRect frame = self.frame;
    frame.origin.y = originY;
    [UIView animateWithDuration:animationDuration animations:^{
        if (animationBlock) {
            animationBlock();
        }
        self.frame = frame;
    }];
}



@end
