#import "User.h"
#import "HPAPIKeys.h"


@interface User ()
@end



@implementation User

- (void)setupWithDictionary:(NSDictionary *)aDictionary
{
    NSDictionary *userDict = [aDictionary valueForKey:APIUserKeys.user];
    
    self.uid =  [NSNumber numberWithInt: ((NSString *)[userDict valueForKey:APICommonKeys.id_]).integerValue];
    self.login = [userDict valueForKey:APIUserKeys.login];
    self.name = [userDict valueForKey:APIUserKeys.name];
    
//    id userpic = [userDict valueForKey:APIUserKeys.avatar];
    //self.userpic = [userDict valueForKey:@"name"];
}


- (BOOL)isLogged
{
    return (self.token != nil);
}

@end
