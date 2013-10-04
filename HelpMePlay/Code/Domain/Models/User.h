#import "_User.h"

#import "HPSelfSetupedMappingObjectProtocol.h"


@interface User : _User <HPSelfSetupedMappingObjectProtocol> {}

- (BOOL)isLogged;

@end
