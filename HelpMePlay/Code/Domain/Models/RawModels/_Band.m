// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Band.m instead.

#import "_Band.h"

const struct BandAttributes BandAttributes = {
};

const struct BandRelationships BandRelationships = {
};

const struct BandFetchedProperties BandFetchedProperties = {
};

@implementation BandID
@end

@implementation _Band

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Band" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Band";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Band" inManagedObjectContext:moc_];
}

- (BandID*)objectID {
	return (BandID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}









@end
