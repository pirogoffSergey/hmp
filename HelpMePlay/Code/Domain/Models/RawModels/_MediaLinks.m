// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MediaLinks.m instead.

#import "_MediaLinks.h"

const struct MediaLinksAttributes MediaLinksAttributes = {
};

const struct MediaLinksRelationships MediaLinksRelationships = {
};

const struct MediaLinksFetchedProperties MediaLinksFetchedProperties = {
};

@implementation MediaLinksID
@end

@implementation _MediaLinks

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"MediaLinks" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"MediaLinks";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"MediaLinks" inManagedObjectContext:moc_];
}

- (MediaLinksID*)objectID {
	return (MediaLinksID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}









@end
