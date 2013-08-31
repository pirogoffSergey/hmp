// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.m instead.

#import "_User.h"

const struct UserAttributes UserAttributes = {
	.name = @"name",
	.token = @"token",
	.uid = @"uid",
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
	
	if ([key isEqualToString:@"uidValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"uid"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic name;






@dynamic token;






@dynamic uid;



- (int32_t)uidValue {
	NSNumber *result = [self uid];
	return [result intValue];
}

- (void)setUidValue:(int32_t)value_ {
	[self setUid:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveUidValue {
	NSNumber *result = [self primitiveUid];
	return [result intValue];
}

- (void)setPrimitiveUidValue:(int32_t)value_ {
	[self setPrimitiveUid:[NSNumber numberWithInt:value_]];
}





@dynamic userpic;






@dynamic playlists;

	
- (NSMutableSet*)playlistsSet {
	[self willAccessValueForKey:@"playlists"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"playlists"];
  
	[self didAccessValueForKey:@"playlists"];
	return result;
}
	






@end
