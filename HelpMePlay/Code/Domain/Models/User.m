#import "User.h"


@interface User ()
@end


static NSString *const kUser = @"user";
static NSString *const kID = @"id";
static NSString *const kLogin = @"login";
static NSString *const kName = @"name";
static NSString *const kUserPic = @"avatar";


@implementation User

- (void)setupWithDictionary:(NSDictionary *)aDictionary
{
    NSDictionary *userDict = [aDictionary valueForKey:kUser];
    
    self.uid =  [NSNumber numberWithInt: ((NSString *)[userDict valueForKey:kID]).integerValue];
    self.login = [userDict valueForKey:kLogin];
    self.name = [userDict valueForKey:kName];
    
//    id userpic = [userDict valueForKey:kUserPic];
    //self.userpic = [userDict valueForKey:@"name"];
}


- (BOOL)isLogged
{
    return (self.token != nil);
}

@end
