// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.m instead.

#import "_User.h"

const struct UserAttributes UserAttributes = {
	.token = @"token",
	.userpic = @"userpic",
};

const struct UserRelationships UserRelationships = {
	.playlists = @"playlists",
};

const struct UserFetchedProperties UserFetchedProperties = {
};

@implementation UserID
@end

@implementation _User

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"User";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"User" inManagedObjectContext:moc_];
}

- (UserID*)objectID {
	return (UserID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic token;






@dynamic userpic;






@dynamic playlists;

	
- (NSMutableSet*)playlistsSet {
	[self willAccessValueForKey:@"playlists"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"playlists"];
  
	[self didAccessValueForKey:@"playlists"];
	return result;
}
	






@end
