// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Audio.m instead.

#import "_Audio.h"

const struct AudioAttributes AudioAttributes = {
};

const struct AudioRelationships AudioRelationships = {
};

const struct AudioFetchedProperties AudioFetchedProperties = {
};

@implementation AudioID
@end

@implementation _Audio

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Audio" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Audio";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Audio" inManagedObjectContext:moc_];
}

- (AudioID*)objectID {
	return (AudioID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}









@end
