// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MediaItem.m instead.

#import "_MediaItem.h"

const struct MediaItemAttributes MediaItemAttributes = {
	.name = @"name",
	.url = @"url",
};

const struct MediaItemRelationships MediaItemRelationships = {
};

const struct MediaItemFetchedProperties MediaItemFetchedProperties = {
};

@implementation MediaItemID
@end

@implementation _MediaItem

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"MediaItem" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"MediaItem";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"MediaItem" inManagedObjectContext:moc_];
}

- (MediaItemID*)objectID {
	return (MediaItemID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic url;











@end
