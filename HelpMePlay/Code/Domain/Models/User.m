#import "User.h"


@interface User ()

// Private interface goes here.

@end


@implementation User

- (BOOL)isLogged
{
    return (self.token != nil);
}

@end
