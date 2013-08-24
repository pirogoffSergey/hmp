// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Composer.m instead.

#import "_Composer.h"

const struct ComposerAttributes ComposerAttributes = {
	.name = @"name",
	.pic = @"pic",
	.uid = @"uid",
};

const struct ComposerRelationships ComposerRelationships = {
};

const struct ComposerFetchedProperties ComposerFetchedProperties = {
};

@implementation ComposerID
@end

@implementation _Composer

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Composer" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Composer";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Composer" inManagedObjectContext:moc_];
}

- (ComposerID*)objectID {
	return (ComposerID*)[super objectID];
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






@dynamic pic;






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










@end
