//
//  HPBaseViewController.m
//  HelpMePlay
//
//  Created by Sergey Pirogov on 31.08.13.
//  Copyright (c) 2013 niXer. All rights reserved.
//

#import "HPBaseViewController.h"

@interface HPBaseViewController ()

@end

@implementation HPBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (NSString *)title
{
    NSString *title = NSStringFromClass(self.class);
    title = [title stringByReplacingOccurrencesOfString:@"HP" withString:@""];
    title = [title stringByReplacingOccurrencesOfString:@"ViewController" withString:@""];
    return title;
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    RESIGN_ALL;
}


@end
